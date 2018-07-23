# OPSIN-ws Docker Image

This is a Docker image for the [OPSIN-ws](https://bitbucket.org/dan2097/opsin-ws) web service by Daniel Lowe.

[OPSIN](https://opsin.ch.cam.ac.uk/index.html) (Open Parser for Systematic IUPAC nomenclature) is a tool for interpreting systematic chemical names and converting them to various structure formats.

## Usage

    docker run --rm -p 8080:8080 mcs07/opsin-ws

The web interface will be available at <localhost:8080>.

Use a file extension to get a specific format. For example:

- <http://localhost:8080/opsin/cyclohexane.png>
- <http://localhost:8080/opsin/cyclohexane.smi>
- <http://localhost:8080/opsin/cyclohexane.json>

Alternatively you can use content negotiation by supplying a MIME type via the Accept HTTP header. Full instructions at <https://opsin.ch.cam.ac.uk/instructions.html>.
