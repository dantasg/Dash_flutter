import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Vendedor extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Vendedor({Key? key}) : super(key: key);

  @override
  State<Vendedor> createState() => _VendedorState();
}

class _VendedorState extends State<Vendedor> {
  List<_Vendedores> dataVendedor = [
    _Vendedores('José', 25000, Colors.green),
    _Vendedores('Thiago', 20000, Colors.black),
    _Vendedores('Felipe', 35000, Colors.blue),
    _Vendedores('Lucas', 5000, Colors.red),
    _Vendedores('João', 15000, Colors.brown),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard vendedor'),
      ),
      body: Column(
        children: [
          SfCircularChart(
            // primaryXAxis: CategoryAxis(),
            // primaryYAxis: NumericAxis(),
            title: ChartTitle(text: 'Dashboard Pais pra teste'),
            // legend: Legend(isVisible: true),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CircularSeries<_Vendedores, String>>[
              PieSeries<_Vendedores, String>(
                dataSource: dataVendedor,
                pointColorMapper: (_Vendedores vendedor, _) => vendedor.color,
                xValueMapper: (_Vendedores vendedor, _) => vendedor.name,
                yValueMapper: (_Vendedores vendedor, _) => vendedor.value,
              ),
            ],
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
                    for (_Vendedores vendedor in dataVendedor)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            vendedor.name,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Vendido: R\$ ${vendedor.value.toString().replaceAll('.', ',')}',
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

class _Vendedores {
  _Vendedores(this.name, this.value, this.color);

  final String name;
  final double value;
  final Color color;
}
