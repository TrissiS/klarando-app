package net.nyx.printerservice.print

import android.os.Parcel
import android.os.Parcelable

// Parcelable mirror of the vendor PrintTextFormat class from incar-postest.apk.
// Field order matches the APK's writeToParcel/readFromParcel contract exactly.
class PrintTextFormat() : Parcelable {
  var h: Int = 0x18
  var i: Boolean = false
  var j: Float = 1.0f
  var k: Float = 1.0f
  var l: Float = 0.0f
  var m: Float = 0.0f
  var n: Int = 0
  var o: Int = 0
  var p: Int = 0
  var q: Int = 0
  var r: Int = 0
  var s: String? = null

  constructor(parcel: Parcel) : this() {
    h = parcel.readInt()
    i = parcel.readByte().toInt() != 0
    j = parcel.readFloat()
    k = parcel.readFloat()
    l = parcel.readFloat()
    m = parcel.readFloat()
    n = parcel.readInt()
    o = parcel.readInt()
    p = parcel.readInt()
    q = parcel.readInt()
    r = parcel.readInt()
    s = parcel.readString()
  }

  fun a(value: Int) {
    p = value
  }

  fun b(value: Int) {
    q = value
  }

  fun c(value: Int) {
    h = value
  }

  override fun writeToParcel(parcel: Parcel, flags: Int) {
    parcel.writeInt(h)
    parcel.writeByte(if (i) 1 else 0)
    parcel.writeFloat(j)
    parcel.writeFloat(k)
    parcel.writeFloat(l)
    parcel.writeFloat(m)
    parcel.writeInt(n)
    parcel.writeInt(o)
    parcel.writeInt(p)
    parcel.writeInt(q)
    parcel.writeInt(r)
    parcel.writeString(s)
  }

  override fun describeContents(): Int = 0

  companion object CREATOR : Parcelable.Creator<PrintTextFormat> {
    override fun createFromParcel(parcel: Parcel): PrintTextFormat = PrintTextFormat(parcel)

    override fun newArray(size: Int): Array<PrintTextFormat?> = arrayOfNulls(size)
  }
}
