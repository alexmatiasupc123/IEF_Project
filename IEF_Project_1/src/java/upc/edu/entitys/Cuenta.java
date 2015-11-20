/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package upc.edu.entitys;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author alex
 */
@Entity
@Table(name = "cuenta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cuenta.findAll", query = "SELECT c FROM Cuenta c"),
    @NamedQuery(name = "Cuenta.findByCuentaId", query = "SELECT c FROM Cuenta c WHERE c.cuentaId = :cuentaId"),
    @NamedQuery(name = "Cuenta.findByNroCuenta", query = "SELECT c FROM Cuenta c WHERE c.nroCuenta = :nroCuenta"),
    @NamedQuery(name = "Cuenta.findByMontoNeto", query = "SELECT c FROM Cuenta c WHERE c.montoNeto = :montoNeto"),
    @NamedQuery(name = "Cuenta.findByEstado", query = "SELECT c FROM Cuenta c WHERE c.estado = :estado")})
public class Cuenta implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cuenta_id")
    private Integer cuentaId;
    @Basic(optional = false)
    @Column(name = "nro_cuenta")
    private String nroCuenta;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "monto_neto")
    private BigDecimal montoNeto;
    @Column(name = "estado")
    private String estado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cuentaId")
    private Collection<Transaccion> transaccionCollection;
    @JoinColumn(name = "usuario_id", referencedColumnName = "usuario_id")
    @ManyToOne(optional = false)
    private Usuario usuarioId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cuentaId")
    private Collection<CostoXCuenta> costoXCuentaCollection;

    public Cuenta() {
    }

    public Cuenta(Integer cuentaId) {
        this.cuentaId = cuentaId;
    }

    public Cuenta(Integer cuentaId, String nroCuenta, BigDecimal montoNeto) {
        this.cuentaId = cuentaId;
        this.nroCuenta = nroCuenta;
        this.montoNeto = montoNeto;
    }

    public Integer getCuentaId() {
        return cuentaId;
    }

    public void setCuentaId(Integer cuentaId) {
        this.cuentaId = cuentaId;
    }

    public String getNroCuenta() {
        return nroCuenta;
    }

    public void setNroCuenta(String nroCuenta) {
        this.nroCuenta = nroCuenta;
    }

    public BigDecimal getMontoNeto() {
        return montoNeto;
    }

    public void setMontoNeto(BigDecimal montoNeto) {
        this.montoNeto = montoNeto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @XmlTransient
    public Collection<Transaccion> getTransaccionCollection() {
        return transaccionCollection;
    }

    public void setTransaccionCollection(Collection<Transaccion> transaccionCollection) {
        this.transaccionCollection = transaccionCollection;
    }

    public Usuario getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(Usuario usuarioId) {
        this.usuarioId = usuarioId;
    }

    @XmlTransient
    public Collection<CostoXCuenta> getCostoXCuentaCollection() {
        return costoXCuentaCollection;
    }

    public void setCostoXCuentaCollection(Collection<CostoXCuenta> costoXCuentaCollection) {
        this.costoXCuentaCollection = costoXCuentaCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cuentaId != null ? cuentaId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cuenta)) {
            return false;
        }
        Cuenta other = (Cuenta) object;
        if ((this.cuentaId == null && other.cuentaId != null) || (this.cuentaId != null && !this.cuentaId.equals(other.cuentaId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "upc.edu.entitys.Cuenta[ cuentaId=" + cuentaId + " ]";
    }
    
}
