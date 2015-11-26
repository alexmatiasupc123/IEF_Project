/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package upc.edu.entitys;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author alex
 */
@Entity
@Table(name = "transaccion")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Transaccion.findAll", query = "SELECT t FROM Transaccion t"),
    @NamedQuery(name = "Transaccion.findByTransaccionId", query = "SELECT t FROM Transaccion t WHERE t.transaccionId = :transaccionId"),
    @NamedQuery(name = "Transaccion.findByCostoBanco", query = "SELECT t FROM Transaccion t WHERE t.costoBanco = :costoBanco"),
    @NamedQuery(name = "Transaccion.findByMonto", query = "SELECT t FROM Transaccion t WHERE t.monto = :monto"),
    @NamedQuery(name = "Transaccion.findByFechaTransaccion", query = "SELECT t FROM Transaccion t WHERE t.fechaTransaccion = :fechaTransaccion"),
    @NamedQuery(name = "Transaccion.findByMotivo", query = "SELECT t FROM Transaccion t WHERE t.motivo = :motivo"),
    @NamedQuery(name = "Transaccion.findBySaldoRestante", query = "SELECT t FROM Transaccion t WHERE t.saldoRestante = :saldoRestante"),
    @NamedQuery(name = "Transaccion.findByActualizado", query = "SELECT t FROM Transaccion t WHERE t.actualizado = :actualizado")})
public class Transaccion implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "transaccion_id")
    private Integer transaccionId;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "costo_banco")
    private BigDecimal costoBanco;
    @Basic(optional = false)
    @Column(name = "monto")
    private BigDecimal monto;
    @Basic(optional = false)
    @Column(name = "fecha_transaccion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaTransaccion;
    @Basic(optional = false)
    @Column(name = "motivo")
    private String motivo;
    @Basic(optional = false)
    @Column(name = "saldo_restante")
    private double saldoRestante;
    @Basic(optional = false)
    @Column(name = "actualizado")
    private int actualizado;
    @JoinColumn(name = "cuenta_id", referencedColumnName = "cuenta_id")
    @ManyToOne(optional = false)
    private Cuenta cuentaId;

    public Transaccion() {
    }

    public Transaccion(Integer transaccionId) {
        this.transaccionId = transaccionId;
    }

    public Transaccion(Integer transaccionId, BigDecimal costoBanco, BigDecimal monto, Date fechaTransaccion, String motivo, double saldoRestante, int actualizado) {
        this.transaccionId = transaccionId;
        this.costoBanco = costoBanco;
        this.monto = monto;
        this.fechaTransaccion = fechaTransaccion;
        this.motivo = motivo;
        this.saldoRestante = saldoRestante;
        this.actualizado = actualizado;
    }

    public Integer getTransaccionId() {
        return transaccionId;
    }

    public void setTransaccionId(Integer transaccionId) {
        this.transaccionId = transaccionId;
    }

    public BigDecimal getCostoBanco() {
        return costoBanco;
    }

    public void setCostoBanco(BigDecimal costoBanco) {
        this.costoBanco = costoBanco;
    }

    public BigDecimal getMonto() {
        return monto;
    }

    public void setMonto(BigDecimal monto) {
        this.monto = monto;
    }

    public Date getFechaTransaccion() {
        return fechaTransaccion;
    }

    public void setFechaTransaccion(Date fechaTransaccion) {
        this.fechaTransaccion = fechaTransaccion;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public double getSaldoRestante() {
        return saldoRestante;
    }

    public void setSaldoRestante(double saldoRestante) {
        this.saldoRestante = saldoRestante;
    }

    public int getActualizado() {
        return actualizado;
    }

    public void setActualizado(int actualizado) {
        this.actualizado = actualizado;
    }

    public Cuenta getCuentaId() {
        return cuentaId;
    }

    public void setCuentaId(Cuenta cuentaId) {
        this.cuentaId = cuentaId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (transaccionId != null ? transaccionId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Transaccion)) {
            return false;
        }
        Transaccion other = (Transaccion) object;
        if ((this.transaccionId == null && other.transaccionId != null) || (this.transaccionId != null && !this.transaccionId.equals(other.transaccionId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "upc.edu.entitys.Transaccion[ transaccionId=" + transaccionId + " ]";
    }
    
}
