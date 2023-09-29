import argparse
from rucio.client import Client

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Args')
    parser.add_argument('--priority', type=int, help='prio')
    parser.add_argument('--dataset', type=str, help='dataset')
    parser.add_argument('--size', type=int, default=1000, help='end_file_num')

    args = parser.parse_args()

    client = Client()

    FILES = [f"/store/data/Run2018A/EGamma/MINIAOD/UL2018_MiniAODv2-v1/{args.dataset}/testSourceFile{j}.root" for j in range(args.size)]

    DIDS = [{"scope": "cms", "name": f} for f in FILES]
    DIDS_W_BYTES = [{"scope": "cms", "name": f, "bytes": 1073741824} for f in FILES]

    DATASET = f"/SenseTest/Run2022-03Jan2023/MYDATA#{args.dataset}"

    client.add_replicas(
      "T2_US_SDSC", DIDS_W_BYTES
    )

    client.add_dataset("cms", DATASET)

    client.add_files_to_datasets(
      [{"scope": "cms", "name": DATASET, "dids": DIDS}]
    )

    client.add_replication_rule(dids=[{"scope": "cms", "name": DATASET}],
      copies=1,
      rse_expression="T2_US_Caltech_Test",
      priority=args.priority,
      source_replica_expression="T2_US_SDSC")
