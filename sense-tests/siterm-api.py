import requests
import json

SITERM_API = "https://sense-caltech-fe.sdn-lb.ultralight.org"

def makePost(url, data):
    cert='/home/users/aaarora/private/certs/rucio-sense.t2.ucsd.edu.pem'
    key='/home/users/aaarora/private/certs/rucio-sense.t2.ucsd.edu-key.pem'
    
    headers = {"Content-type": 'application/json',
                "User-agent": "SiteRM",
                "Accept": 'application/json'}
    
    response = requests.post(SITERM_API + url, data=data, headers=headers, cert=(cert, key), verify=False)
    return response

def debugActions(sitename, dataIn, dataUpd):
    """Test Debug Actions: submit, get update"""
    # SUBMIT
    urls = f"/{sitename}/sitefe/json/frontend/submitdebug/NEW"
    outs = makePost(urls, dataIn)
    print(outs.json())

def test_debug_iperf(sitename):
    """Test Debug Iperf API"""
    data = {"type": "iperf", "sitename": "", "hostname": "dummyhostname",
            "interface": "dummyinterface", "ip": "1.2.3.4", "port": "1234", "time": "60"}
    outsuc = {"out": ["iperf success", "from unittest"], "err": "", "exitCode": 0}
    dataupd = {'state': 'success', 'output': json.dumps(outsuc)}
    debugActions(sitename, data, dataupd)

def test_debug_iperfserver(sitename):
    """Test Debug IperfServer API"""
    data = {"type": "iperfserver", "sitename": "", "hostname": "dummyhostname", "onetime": "True",
            "interface": "dummyinterface", "ip": "1.2.3.4", "port": "1234", "time": "60"}
    outsuc = {"out": ["iperf server success", "from unittest"], "err": "", "exitCode": 0}
    dataupd = {'state': 'success', 'output': json.dumps(outsuc)}
    debugActions(sitename, data, dataupd)

if __name__ == '__main__':
    test_debug_iperf('T2_US_Caltech_Test')