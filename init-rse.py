from rucio.client import Client

client = Client()

SDSC = {
    "hostname": "xrootd-sense-ucsd-redirector.sdsc.optiputer.net",
    "scheme": "https",
    "port": 1094,
    "prefix": "//",
    "impl": "rucio.rse.protocols.gfal.Default",
    "domains": {
        "lan": {
            "read": 1,
            "write": 1,
            "delete": 1
        },
        "wan": {
            "read": 1,
            "write": 1,
            "delete": 1,
            "third_party_copy_read": 1,
            "third_party_copy_write": 1
        }
    }
}

CALTECH = {
    "hostname": "sense-redir-01.ultralight.org",
    "scheme": "https",
    "port": 1094,
    "prefix": "//store/temp",
    "impl": "rucio.rse.protocols.gfal.Default",
    "domains": {
        "lan": {
            "read": 1,
            "write": 1,
            "delete": 1
        },
        "wan": {
            "read": 1,
            "write": 1,
            "delete": 1,
            "third_party_copy_read": 1,
            "third_party_copy_write": 1
        }
    }
}

client.add_rse("T2_US_SDSC")
client.add_rse("T2_US_Caltech_Test")

client.add_protocol("T2_US_SDSC", SDSC)
client.add_protocol("T2_US_Caltech_Test", CALTECH)

client.add_distance("T2_US_SDSC", "T2_US_Caltech_Test", {"ranking":1,"distance":1})
client.add_distance("T2_US_Caltech_Test", "T2_US_SDSC", {"ranking":1,"distance":1})

client.set_local_account_limit("root", "T2_US_SDSC", "-1" )
client.set_local_account_limit("root", "T2_US_Caltech_Test", "-1" )

client.add_rse_attribute("T2_US_SDSC", "fts", "https://cmsftssrv3.fnal.gov:8446")
client.add_rse_attribute("T2_US_Caltech_Test", "fts", "https://cmsftssrv3.fnal.gov:8446")

client.add_rse_attribute("T2_US_SDSC", "lfn2pfn_algorithm", "cmstfc")
client.add_rse_attribute("T2_US_Caltech_Test", "lfn2pfn_algorithm", "cmstfc")

client.add_scope("root", "cms")
