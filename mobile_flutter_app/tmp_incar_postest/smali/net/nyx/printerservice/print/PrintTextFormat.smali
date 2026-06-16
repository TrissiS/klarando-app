.class public Lnet/nyx/printerservice/print/PrintTextFormat;
.super Ljava/lang/Object;
.source "PrintTextFormat.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lnet/nyx/printerservice/print/PrintTextFormat;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public h:I

.field public i:Z

.field public j:F

.field public k:F

.field public l:F

.field public m:F

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Lnet/nyx/printerservice/print/PrintTextFormat$a;

    invoke-direct {v0}, Lnet/nyx/printerservice/print/PrintTextFormat$a;-><init>()V

    sput-object v0, Lnet/nyx/printerservice/print/PrintTextFormat;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x18

    .line 2
    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->h:I

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->i:Z

    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    iput v1, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->j:F

    .line 5
    iput v1, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->k:F

    const/4 v1, 0x0

    .line 6
    iput v1, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->l:F

    .line 7
    iput v1, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->m:F

    .line 8
    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->n:I

    .line 9
    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->o:I

    .line 10
    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->p:I

    .line 11
    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->q:I

    .line 12
    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->r:I

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 4

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x18

    .line 14
    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->h:I

    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->i:Z

    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    iput v1, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->j:F

    .line 17
    iput v1, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->k:F

    const/4 v1, 0x0

    .line 18
    iput v1, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->l:F

    .line 19
    iput v1, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->m:F

    .line 20
    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->n:I

    .line 21
    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->o:I

    .line 22
    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->p:I

    .line 23
    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->q:I

    .line 24
    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->r:I

    .line 25
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->h:I

    .line 26
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_2c

    const/4 v0, 0x1

    :cond_2c
    iput-boolean v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->i:Z

    .line 27
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->j:F

    .line 28
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->k:F

    .line 29
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->l:F

    .line 30
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->m:F

    .line 31
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->n:I

    .line 32
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->o:I

    .line 33
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->p:I

    .line 34
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->q:I

    .line 35
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->r:I

    .line 36
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->s:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a(I)V
    .registers 2

    .line 1
    iput p1, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->p:I

    return-void
.end method

.method public b(I)V
    .registers 2

    .line 1
    iput p1, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->q:I

    return-void
.end method

.method public c(I)V
    .registers 2

    .line 1
    iput p1, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->h:I

    return-void
.end method

.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    .line 1
    iget p2, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->h:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 2
    iget-boolean p2, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->i:Z

    int-to-byte p2, p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 3
    iget p2, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->j:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 4
    iget p2, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->k:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 5
    iget p2, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->l:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 6
    iget p2, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->m:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 7
    iget p2, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->n:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 8
    iget p2, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->o:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 9
    iget p2, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->p:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 10
    iget p2, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->q:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 11
    iget p2, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->r:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 12
    iget-object p2, p0, Lnet/nyx/printerservice/print/PrintTextFormat;->s:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
