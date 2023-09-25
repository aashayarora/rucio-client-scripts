from time import sleep
from sense_api import *

if __name__ == "__main__":
    logging.basicConfig(
        format="(%(threadName)s) [%(asctime)s] %(levelname)s: %(message)s",
        datefmt="%m-%d-%Y %H:%M:%S %p",
        level="INFO",
    )

    logging.info("Creating SENSE Path")
    
    src_uri = get_uri("T2_US_SDSC")
    src_ipv6 = "2001:48d0:3001:111::/64"

    dst_uri = get_uri("T2_US_Caltech_Test")
    dst_ipv6 = "2605:d9c0:2:fff1::/64"

    INSTANCE_UUID, _ = stage_link(src_uri, dst_uri, src_ipv6, dst_ipv6, instance_uuid="", alias="Cron SENSE Test")
    provision_link(INSTANCE_UUID, src_uri, dst_uri, src_ipv6, dst_ipv6, 10000, alias="Cron SENSE Test")

    logging.info("Starting Throughput Test")
    sleep(60)
    logging.info("Finishing Throughput Test")

    delete_link(INSTANCE_UUID)
