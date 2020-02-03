FROM continuumio/miniconda3
RUN conda install -c potassco clingo pip
RUN pip install clyngor
