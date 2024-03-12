import 'package:flutter/material.dart';

import '../models/item/item.dart';
import '../models/util/rm_icon.dart';

class Shredder extends Item {
  const Shredder()
      : super(
            icon: const RMIcon(icon: Icons.abc_rounded),
            name: "Shredder",
            price: 2500,
            description:
                "Shreds materials in small pieces in preparation for the recycling process.");
}

class ComputerDismantlingStation extends Item {
  const ComputerDismantlingStation()
      : super(
            icon: const RMIcon(icon: Icons.abc_rounded),
            name: "Dismantling Station",
            price: 2500,
            description:
                "Computers are dismantled to separate different components and materials.");
}

class DataWiper extends Item {
  const DataWiper()
      : super(
            icon: const RMIcon(icon: Icons.abc_rounded),
            name: "Data Wiper",
            price: 2500,
            description:
                "Wipes the data from old hard drives and other storage devices to protect sensitive information.");
}

class HazardousWasteDisposer extends Item {
  const HazardousWasteDisposer()
      : super(
            icon: const RMIcon(icon: Icons.abc_rounded),
            name: "Hazardous Waste Disposer",
            price: 2500,
            description:
                "Diposes of hazardous waste in a safe and responsible manner.");
}

class MeltingStation extends Item {
  const MeltingStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Melting Station",
          price: 2500,
          description:
              "Melts metals and plastics so that they can be used in new products.",
        );
}

class ScreeningStation extends Item {
  const ScreeningStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Screening Station",
          price: 500,
          description:
              "Further removal of remaining contaminants like small bits of plastic, glue, or metal.",
        );
}

class CompositingStation extends Item {
  const CompositingStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Compositing Station",
          price: 500,
          description:
              "Microorganisms break down the organic matter over time through aerobic decomposition, which requires oxygen. Moisture and a balance of carbon-rich and nitrogen-rich materials are key.",
        );
}

class PreProcessor extends Item {
  const PreProcessor()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Pre-Processing",
          price: 500,
          description:
              "Large contaminants like plastics or metals are removed. Depending on the scale, waste may be shredded.",
        );
}

class CurationStation extends Item {
  const CurationStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Curation Station",
          price: 500,
          description:
              "The compost matures further, stabilizing the temperature and allowing for additional decomposition.",
        );
}

class SortingStation extends Item {
  const SortingStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Sorting Station",
          price: 500,
          description:
              "Different grades of paper are separated. Larger contaminants like plastic wrap or staples are removed.",
        );
}

class PulpingStation extends Item {
  const PulpingStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Pulping Station",
          price: 500,
          description:
              "The paper is shredded and mixed with water and chemicals to break it down into a slurry of fibers called pulp.",
        );
}

class DeInkingStation extends Item {
  const DeInkingStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "De-inking Station",
          price: 500,
          description:
              "Chemicals and air bubbles help separate ink from the paper fibers. The ink is skimmed off and disposed of.",
        );
}

class BleachingStation extends Item {
  const BleachingStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Bleaching Station",
          price: 500,
          description:
              "Depending on the desired whiteness of the end product, the pulp may be bleached.",
        );
}

class PapermakingStation extends Item {
  const PapermakingStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Papermaking Station",
          price: 500,
          description:
              "The pulp is spread onto a mesh conveyor belt, where water drains out, and the fibers begin to bond. The sheet is pressed, heated, and dried, forming a new roll of recycled paper.",
        );
}

class PlasticSortingStation extends Item {
  const PlasticSortingStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Sorting Station",
          price: 500,
          description:
              "Bottles are sorted by color and any remaining contaminants are removed, such as lids and labels.",
        );
}

class BalingStation extends Item {
  const BalingStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Baling Station",
          price: 15000,
          description:
              "The sorted bottles are compressed into large bales for efficient transport.",
        );
}

class WashingStation extends Item {
  const WashingStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Washing Station",
          price: 10000,
          description:
              "Flakes are thoroughly washed to remove any residues or food contamination.",
        );
}

class PlasticMeltingStation extends Item {
  const PlasticMeltingStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Melting Station",
          price: 20000,
          description:
              "The plastic flakes are melted down into a molten state.",
        );
}

class PelletizingStation extends Item {
  const PelletizingStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Pelletizing Station",
          price: 10000,
          description:
              "The melted plastic is extruded and cut into small pellets, making it easy to handle and use in manufacturing.",
        );
}

class MetalSortingStation extends Item {
  const MetalSortingStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Sorting Station",
          price: 10000,
          description:
              "Metals must be separated into ferrous and non-ferrous categories. Within these, further sorting by alloy type (stainless steel, copper grades, etc.) may occur. Magnets help with ferrous identification.",
        );
}

class MetalMeltingStation extends Item {
  const MetalMeltingStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Melting Station",
          price: 2500,
          description:
              "Ferrous metals are often melted in large electric arc furnaces, creating molten steel. For non-ferrous metals, furnaces are specialized to the metal type",
        );
}

class PurificationStation extends Item {
  const PurificationStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Purification Station",
          price: 10000,
          description:
              "The molten metal is refined to remove impurities. Techniques vary but could involve adding chemicals, using fluxes, or skimming off slag.",
        );
}

class SolidificationStation extends Item {
  const SolidificationStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Solidification Station",
          price: 500,
          description:
              "Molten metal is poured into molds to create ingots for easy transport and later use.",
        );
}

class CostPlaceholder extends Item {
  const CostPlaceholder({required super.price})
      : super(
            icon: const RMIcon(icon: Icons.money_rounded),
            name: "Cost Placeholder");

  @override
  bool operator ==(Object other) {
    if (other is! CostPlaceholder) {
      return false;
    }

    return other.hashCode == hashCode;
  }

  @override
  int get hashCode => price;
}

class CraftingItems {
  static const shredder = Shredder();
  static const computerDismantlingStation = ComputerDismantlingStation();
  static const dataWiper = DataWiper();
  static const hazardousWasteDisposer = HazardousWasteDisposer();
  static const meltingStation = MeltingStation();
  static const preProcessor = PreProcessor();
  static const compositingStation = CompositingStation();
  static const curationStation = CurationStation();
  static const screeningStation = ScreeningStation();
  static const sortingStation = SortingStation();
  static const pulpingStation = PulpingStation();
  static const bleachingStation = BleachingStation();
  static const deInkingStation = DeInkingStation();
  static const papermakingStation = PapermakingStation();
  static const washingStation = WashingStation();
  static const pelletizingStation = PelletizingStation();
  static const plasticMeltingStation = PlasticMeltingStation();
  static const balingStation = BalingStation();
  static const plasticSortingStation = PlasticSortingStation();
  static const metalSortingStation = MetalSortingStation();
  static const metalMeltingStation = MetalMeltingStation();
  static const purificationStation = PurificationStation();
  static const solidificationStation = SolidificationStation();

  static CostPlaceholder costPlaceholder(int cost) {
    return CostPlaceholder(price: cost);
  }
}
