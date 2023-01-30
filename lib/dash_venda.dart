import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Venda extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Venda({Key? key}) : super(key: key);

  @override
  State<Venda> createState() => _VendaState();
}

class _VendaState extends State<Venda> {
  List<_Mes> dataMes = [
    _Mes('Jan', 45000),
    _Mes('Fev', 25000),
    _Mes('Mar', 15000),
    _Mes('Abr', 35000),
    _Mes('Mai', 10000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard de vendas'),
      ),
      body: Column(
        children: [
          SfPyramidChart(
            title: ChartTitle(text: 'Dashboard Pais pra teste'),
            // legend: Legend(isVisible: true),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: PyramidSeries<_Mes, String>(
                dataSource: dataMes,
                xValueMapper: (_Mes mes, _) => mes.name,
                yValueMapper: (_Mes mes, _) => mes.value),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey[200],
                ),
                padding: const EdgeInsets.all(8),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (_Mes mes in dataMes)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            mes.name,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Vendido: R\$ ${mes.value.toString().replaceAll('.', ',')}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Mes {
  _Mes(this.name, this.value);

  final String name;
  final double value;
}
