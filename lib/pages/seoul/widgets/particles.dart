import 'dart:math';

import 'package:city_animation/pages/seoul/widgets/particle.dart';
import 'package:city_animation/utils/utils.dart';
import 'package:flutter/material.dart';

class Particles extends StatefulWidget {
  final double width;
  final double height;
  final int count;

  const Particles({
    Key key,
    this.width,
    this.height,
    this.count,
  }) : super(key: key);

  @override
  _ParticlesState createState() => _ParticlesState();
}

class _ParticlesState extends State<Particles>
    with SingleTickerProviderStateMixin {
  double angle = 0;

  AnimationController _controller;
  Random _rnd = Random();

  List<ParticleData> _particles;

  @override
  void initState() {
    super.initState();

    _createParticle();

    _controller = AnimationController(
      lowerBound: 0,
      upperBound: 1,
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  _createParticle() {
    _particles = [];
    for (var i = 0; i < widget.count; i++) {
      _particles.add(ParticleData(
        x: Utils.randomRange(0, widget.width),
        y: Utils.randomRange(0, widget.height),
        v: Utils.randomRange(1, 3),
        a: _rnd.nextDouble() * 0.05,
        rotation: Utils.randomRange(0, 360),
      ));
    }
  }

  _update() {
    angle += 0.01;

    for (var i = 0; i < widget.count; i++) {
      var particle = _particles[i];
      particle.y -= particle.v + particle.a;
      particle.x += cos(angle) * 0.25;
      particle.rotation += _rnd.nextDouble() * 2;

      if (particle.x < -10 ||
          particle.x > widget.width + 10 ||
          particle.y < -10) {
        particle.x = Utils.randomRange(0, widget.width);
        particle.y = widget.height;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          _update();
          return Stack(
            children: [
              for (var i = 0; i < _particles.length; i++)
                Particle(
                  x: _particles[i].x,
                  y: _particles[i].y,
                  rotation: _particles[i].rotation,
                )
            ],
          );
        },
      ),
    );
  }
}

class ParticleData {
  double x;
  double y;
  double v;
  double a;
  double rotation;

  ParticleData({
    this.x,
    this.y,
    this.v,
    this.a,
    this.rotation,
  });
}
