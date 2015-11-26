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
@Table(name = "datos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Datos.findAll", query = "SELECT d FROM Datos d"),
    @NamedQuery(name = "Datos.findByFechaActualizada", query = "SELECT d FROM Datos d WHERE d.fechaActualizada = :fechaActualizada"),
    @NamedQuery(name = "Datos.findByCosto", query = "SELECT d FROM Datos d WHERE d.costo = :costo"),
    @NamedQuery(name = "Datos.findByTasa", query = "SELECT d FROM Datos d WHERE d.tasa = :tasa"),
    @NamedQuery(name = "Datos.findByDatosid", query = "SELECT d FROM Datos d WHERE d.datosid = :datosid")})
public class Datos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "fecha_actualizada")
    @Temporal(TemporalType.DATE)
    private Date fechaActualizada;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "costo")
    private BigDecimal costo;
    @Basic(optional = false)
    @Column(name = "tasa")
    private BigDecimal tasa;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "datosid")
    private Integer datosid;

    public Datos() {
    }

    public Datos(Integer datosid) {
        this.datosid = datosid;
    }

    public Datos(Integer datosid, Date fechaActualizada, BigDecimal costo, BigDecimal tasa) {
        this.datosid = datosid;
        this.fechaActualizada = fechaActualizada;
        this.costo = costo;
        this.tasa = tasa;
    }

    public Date getFechaActualizada() {
        return fechaActualizada;
    }

    public void setFechaActualizada(Date fechaActualizada) {
        this.fechaActualizada = fechaActualizada;
    }

    public BigDecimal getCosto() {
        return costo;
    }

    public void setCosto(BigDecimal costo) {
        this.costo = costo;
    }

    public BigDecimal getTasa() {
        return tasa;
    }

    public void setTasa(BigDecimal tasa) {
        this.tasa = tasa;
    }

    public Integer getDatosid() {
        return datosid;
    }

    public void setDatosid(Integer datosid) {
        this.datosid = datosid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (datosid != null ? datosid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Datos)) {
            return false;
        }
        Datos other = (Datos) object;
        if ((this.datosid == null && other.datosid != null) || (this.datosid != null && !this.datosid.equals(other.datosid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "upc.edu.entitys.Datos[ datosid=" + datosid + " ]";
    }
    
}
