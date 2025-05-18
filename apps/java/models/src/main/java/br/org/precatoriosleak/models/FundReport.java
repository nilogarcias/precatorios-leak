package br.org.precatoriosleak.models;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Date;

@Getter
@AllArgsConstructor
public class FundReport {
    private long id;
    private String descricaoFundo;
    private String dataReferencia;
    private Date dataEntrega;
    private String descricaoStatus;
    private String categoria;
    private String tipoRelatorio;
    private String descricaoModalidade;
}
