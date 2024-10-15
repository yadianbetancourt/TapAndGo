import 'package:flutter/material.dart';

class LatestTransactionsComponent extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {
      "id": 10322,
      "product": "Elegant T-Shirt",
      "details": "Men Series   M   1 Pcs   BW",
      "amount": 45.95,
      "status": "Success",
    },
    {
      "id": 10321,
      "product": "Sabaya Tunic",
      "details": "Women Series   XL   1 Pcs   Black",
      "amount": 50.95,
      "status": "Success",
    },
  ];

  LatestTransactionsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest Transactions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              'Latest Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Top action bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.refresh),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Data Table for transactions
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 20,
                  columns: const [
                    DataColumn(label: Text('Transaction ID')),
                    DataColumn(label: Text('Product')),
                    DataColumn(label: Text('Amount')),
                    DataColumn(label: Text('Status')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: transactions.map((transaction) {
                    return DataRow(cells: [
                      DataCell(Text('#${transaction["id"]}')),
                      DataCell(Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transaction["product"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          Text(transaction["details"],
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey)),
                        ],
                      )),
                      DataCell(Text(
                        '\$${transaction["amount"].toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                      DataCell(Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Success',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                          ),
                        ),
                      )),
                      DataCell(Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit, size: 20),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete, size: 20),
                          ),
                        ],
                      )),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

