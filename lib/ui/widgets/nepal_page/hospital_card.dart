import 'package:flutter/material.dart';

import 'package:covid19_info/core/models/hospital.dart';

import 'package:covid19_info/ui/styles/styles.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:covid19_info/ui/widgets/common/tag.dart';
import 'package:covid19_info/ui/widgets/common/icon_row.dart';
import 'package:covid19_info/ui/widgets/nepal_page/hospital_details/hospital_details.dart';

class HospitalCard extends StatelessWidget {
  final Color color;
  final Hospital hospital;

  const HospitalCard({
    @required this.hospital,
    this.color = AppColors.dark,
  }) : assert(hospital != null);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _openBottomSheet(context),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: AppColors.dark,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconRow(
                label: hospital.name,
                iconData: LineAwesomeIcons.hospital_o,
                labelStyle: AppTextStyles.mediumLight,
                color: color,
              ),
              IconRow(
                label: hospital.address.isEmpty ? 'N/A' : hospital.address,
                iconData: LineAwesomeIcons.map,
                labelStyle: AppTextStyles.smallLight,
                color: color,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: IconRow(
                      label: hospital.phone.isEmpty ? 'N/A' : hospital.phone,
                      iconData: LineAwesomeIcons.phone,
                      labelStyle: AppTextStyles.smallLight,
                      color: color,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  if (hospital.phone.isNotEmpty)
                    Tag(
                      label: 'Call',
                      color: color,
                      iconData: LineAwesomeIcons.phone,
                      onPressed: () {
                        // TODO: Open phone
                      },
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      elevation: 12.0,
      backgroundColor: AppColors.dark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
          child: HospitalDetails(
            hospital: hospital,
            color: color,
          ),
        );
      },
    );
  }
}