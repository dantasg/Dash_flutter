import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardCidade extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  DashboardCidade({Key? key}) : super(key: key);

  @override
  State<DashboardCidade> createState() => _DashboardCidadeState();
}

class _DashboardCidadeState extends State<DashboardCidade> {
  List<_Cidade> dataCidade = [
    _Cidade('Castanhal', 50400),
    _Cidade('Belém', 32020),
    _Cidade('Capanema', 40200),
    _Cidade('Santa Maria', 21200),
    _Cidade('Mãe do Rio', 14100),
    _Cidade('Curuçá', 20120),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Primeiro teste DashBoard Flutter'),
      ),
      body: Column(
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(),
            title: ChartTitle(text: 'Dashboard Pais pra teste'),
            // legend: Legend(isVisible: true),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_Cidade, String>>[
              ColumnSeries<_Cidade, String>(
                dataSource: dataCidade,
                xValueMapper: (_Cidade cidade, _) => cidade.name,
                yValueMapper: (_Cidade cidade, _) => cidade.value,
                name: 'Pais',
                spacing: 0.1,
              )
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
                    for (_Cidade cidade in dataCidade)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cidade.name,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Vendido: R\$ ${cidade.value.toString().replaceAll('.', ',')}',
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

class _Cidade {
  _Cidade(this.name, this.value);

  final String name;
  final double value;
}
