from rucio.client import Client

client = Client()

FILES = [f"/store/data/Run2018A/EGamma/MINIAOD/UL2018_MiniAODv2-v1/50000/testSourceFile{j}.root" for j in range(600)]
DIDS = [{"scope": "cms", "name": f} for f in FILES]
DIDS_W_BYTES = [{"scope": "cms", "name": f, "bytes": 1073741824} for f in FILES]

DATASET = "/SenseTest/Run2022-03Jan2023/MYDATA#0"

client.add_replicas(
  "T2_US_SDSC", DIDS_W_BYTES
)

client.add_dataset("cms", DATASET)

client.add_files_to_datasets(
  [{"scope": "cms", "name": DATASET, "dids": DIDS}]
)
