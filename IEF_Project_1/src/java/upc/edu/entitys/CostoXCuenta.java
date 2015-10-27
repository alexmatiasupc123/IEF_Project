/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package upc.edu.entitys;

import java.io.Serializable;
import java.math.BigDecimal;
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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author alex
 */
@Entity
@Table(name = "costo_x_cuenta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CostoXCuenta.findAll", query = "SELECT c FROM CostoXCuenta c"),
    @NamedQuery(name = "CostoXCuenta.findByCostoXCuentaId", query = "SELECT c FROM CostoXCuenta c WHERE c.costoXCuentaId = :costoXCuentaId"),
    @NamedQuery(name = "CostoXCuenta.findByMontoTotalCosto", query = "SELECT c FROM CostoXCuenta c WHERE c.montoTotalCosto = :montoTotalCosto")})
public class CostoXCuenta implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "costo_x_cuenta_id")
    private Integer costoXCuentaId;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "monto_total_costo")
    private BigDecimal montoTotalCosto;
    @JoinColumn(name = "cuenta_id", referencedColumnName = "cuenta_id")
    @ManyToOne(optional = false)
    private Cuenta cuentaId;

    public CostoXCuenta() {
    }

    public CostoXCuenta(Integer costoXCuentaId) {
        this.costoXCuentaId = costoXCuentaId;
    }

    public CostoXCuenta(Integer costoXCuentaId, BigDecimal montoTotalCosto) {
        this.costoXCuentaId = costoXCuentaId;
        this.montoTotalCosto = montoTotalCosto;
    }

    public Integer getCostoXCuentaId() {
        return costoXCuentaId;
    }

    public void setCostoXCuentaId(Integer costoXCuentaId) {
        this.costoXCuentaId = costoXCuentaId;
    }

    public BigDecimal getMontoTotalCosto() {
        return montoTotalCosto;
    }

    public void setMontoTotalCosto(BigDecimal montoTotalCosto) {
        this.montoTotalCosto = montoTotalCosto;
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
        hash += (costoXCuentaId != null ? costoXCuentaId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CostoXCuenta)) {
            return false;
        }
        CostoXCuenta other = (CostoXCuenta) object;
        if ((this.costoXCuentaId == null && other.costoXCuentaId != null) || (this.costoXCuentaId != null && !this.costoXCuentaId.equals(other.costoXCuentaId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "upc.edu.entitys.CostoXCuenta[ costoXCuentaId=" + costoXCuentaId + " ]";
    }
    
}
