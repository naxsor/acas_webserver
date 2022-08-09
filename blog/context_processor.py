from sensors.models import Process

def process(request):
    ccn_status = Process.objects.get(name="ccn_process")
    uv_lif_status = Process.objects.get(name="uv_lif_process")
    dma_status = Process.objects.get(name="dma_process")
    bcp_status = Process.objects.get(name="bcp_process")
    cpd3_status = Process.objects.get(name="cpd3_process")
    liis_status = Process.objects.get(name="sp2_process")
    tdlh_status = Process.objects.get(name="hygrometer_process")
    bam_status = Process.objects.get(name="bam_process")
    acsm_status = Process.objects.get(name="bam_process")
    sensors = {"ccn": ccn_status.status, "uv_lif":uv_lif_status.status, "dma":dma_status.status,
            "bcp":bcp_status.status, "cpd3":cpd3_status.status, "liis":liis_status.status, "tdlh":tdlh_status.status,
            "bam":bam_status.status, "acsm":acsm_status.status}
    return {'sensors':sensors}


