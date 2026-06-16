.class public abstract Lb/f/a/b/r;
.super Ljava/lang/Object;
.source "SplineSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/a/b/r$m;,
        Lb/f/a/b/r$g;,
        Lb/f/a/b/r$b;,
        Lb/f/a/b/r$p;,
        Lb/f/a/b/r$o;,
        Lb/f/a/b/r$n;,
        Lb/f/a/b/r$l;,
        Lb/f/a/b/r$k;,
        Lb/f/a/b/r$d;,
        Lb/f/a/b/r$f;,
        Lb/f/a/b/r$e;,
        Lb/f/a/b/r$j;,
        Lb/f/a/b/r$i;,
        Lb/f/a/b/r$h;,
        Lb/f/a/b/r$a;,
        Lb/f/a/b/r$c;
    }
.end annotation


# instance fields
.field public a:Lb/f/a/a/b;

.field public b:[I

.field public c:[F

.field public d:I

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xa

    new-array v1, v0, [I

    .line 2
    iput-object v1, p0, Lb/f/a/b/r;->b:[I

    new-array v0, v0, [F

    .line 3
    iput-object v0, p0, Lb/f/a/b/r;->c:[F

    return-void
.end method

.method public static a(Ljava/lang/String;Landroid/util/SparseArray;)Lb/f/a/b/r;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/util/SparseArray<",
            "Lb/f/c/a;",
            ">;)",
            "Lb/f/a/b/r;"
        }
    .end annotation

    .line 3
    new-instance v0, Lb/f/a/b/r$b;

    invoke-direct {v0, p0, p1}, Lb/f/a/b/r$b;-><init>(Ljava/lang/String;Landroid/util/SparseArray;)V

    return-object v0
.end method

.method public static b(Ljava/lang/String;)Lb/f/a/b/r;
    .registers 2

    .line 2
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_11e

    goto/16 :goto_b8

    :sswitch_9
    const-string v0, "waveOffset"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/16 p0, 0xa

    goto/16 :goto_b9

    :sswitch_15
    const-string v0, "alpha"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/4 p0, 0x0

    goto/16 :goto_b9

    :sswitch_20
    const-string v0, "transitionPathRotate"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/4 p0, 0x7

    goto/16 :goto_b9

    :sswitch_2b
    const-string v0, "elevation"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/4 p0, 0x1

    goto/16 :goto_b9

    :sswitch_36
    const-string v0, "rotation"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/4 p0, 0x2

    goto/16 :goto_b9

    :sswitch_41
    const-string v0, "transformPivotY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/4 p0, 0x6

    goto/16 :goto_b9

    :sswitch_4c
    const-string v0, "transformPivotX"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/4 p0, 0x5

    goto/16 :goto_b9

    :sswitch_57
    const-string v0, "waveVariesBy"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/16 p0, 0xb

    goto :goto_b9

    :sswitch_62
    const-string v0, "scaleY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/16 p0, 0x9

    goto :goto_b9

    :sswitch_6d
    const-string v0, "scaleX"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/16 p0, 0x8

    goto :goto_b9

    :sswitch_78
    const-string v0, "progress"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/16 p0, 0xf

    goto :goto_b9

    :sswitch_83
    const-string v0, "translationZ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/16 p0, 0xe

    goto :goto_b9

    :sswitch_8e
    const-string v0, "translationY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/16 p0, 0xd

    goto :goto_b9

    :sswitch_99
    const-string v0, "translationX"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/16 p0, 0xc

    goto :goto_b9

    :sswitch_a4
    const-string v0, "rotationY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/4 p0, 0x4

    goto :goto_b9

    :sswitch_ae
    const-string v0, "rotationX"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b8

    const/4 p0, 0x3

    goto :goto_b9

    :cond_b8
    :goto_b8
    const/4 p0, -0x1

    :goto_b9
    packed-switch p0, :pswitch_data_160

    const/4 p0, 0x0

    return-object p0

    .line 3
    :pswitch_be
    new-instance p0, Lb/f/a/b/r$g;

    invoke-direct {p0}, Lb/f/a/b/r$g;-><init>()V

    return-object p0

    .line 4
    :pswitch_c4
    new-instance p0, Lb/f/a/b/r$p;

    invoke-direct {p0}, Lb/f/a/b/r$p;-><init>()V

    return-object p0

    .line 5
    :pswitch_ca
    new-instance p0, Lb/f/a/b/r$o;

    invoke-direct {p0}, Lb/f/a/b/r$o;-><init>()V

    return-object p0

    .line 6
    :pswitch_d0
    new-instance p0, Lb/f/a/b/r$n;

    invoke-direct {p0}, Lb/f/a/b/r$n;-><init>()V

    return-object p0

    .line 7
    :pswitch_d6
    new-instance p0, Lb/f/a/b/r$a;

    invoke-direct {p0}, Lb/f/a/b/r$a;-><init>()V

    return-object p0

    .line 8
    :pswitch_dc
    new-instance p0, Lb/f/a/b/r$a;

    invoke-direct {p0}, Lb/f/a/b/r$a;-><init>()V

    return-object p0

    .line 9
    :pswitch_e2
    new-instance p0, Lb/f/a/b/r$l;

    invoke-direct {p0}, Lb/f/a/b/r$l;-><init>()V

    return-object p0

    .line 10
    :pswitch_e8
    new-instance p0, Lb/f/a/b/r$k;

    invoke-direct {p0}, Lb/f/a/b/r$k;-><init>()V

    return-object p0

    .line 11
    :pswitch_ee
    new-instance p0, Lb/f/a/b/r$d;

    invoke-direct {p0}, Lb/f/a/b/r$d;-><init>()V

    return-object p0

    .line 12
    :pswitch_f4
    new-instance p0, Lb/f/a/b/r$f;

    invoke-direct {p0}, Lb/f/a/b/r$f;-><init>()V

    return-object p0

    .line 13
    :pswitch_fa
    new-instance p0, Lb/f/a/b/r$e;

    invoke-direct {p0}, Lb/f/a/b/r$e;-><init>()V

    return-object p0

    .line 14
    :pswitch_100
    new-instance p0, Lb/f/a/b/r$j;

    invoke-direct {p0}, Lb/f/a/b/r$j;-><init>()V

    return-object p0

    .line 15
    :pswitch_106
    new-instance p0, Lb/f/a/b/r$i;

    invoke-direct {p0}, Lb/f/a/b/r$i;-><init>()V

    return-object p0

    .line 16
    :pswitch_10c
    new-instance p0, Lb/f/a/b/r$h;

    invoke-direct {p0}, Lb/f/a/b/r$h;-><init>()V

    return-object p0

    .line 17
    :pswitch_112
    new-instance p0, Lb/f/a/b/r$c;

    invoke-direct {p0}, Lb/f/a/b/r$c;-><init>()V

    return-object p0

    .line 18
    :pswitch_118
    new-instance p0, Lb/f/a/b/r$a;

    invoke-direct {p0}, Lb/f/a/b/r$a;-><init>()V

    return-object p0

    :sswitch_data_11e
    .sparse-switch
        -0x4a771f66 -> :sswitch_ae
        -0x4a771f65 -> :sswitch_a4
        -0x490b9c39 -> :sswitch_99
        -0x490b9c38 -> :sswitch_8e
        -0x490b9c37 -> :sswitch_83
        -0x3bab3dd3 -> :sswitch_78
        -0x3621dfb2 -> :sswitch_6d
        -0x3621dfb1 -> :sswitch_62
        -0x2f893320 -> :sswitch_57
        -0x2d5a2d1e -> :sswitch_4c
        -0x2d5a2d1d -> :sswitch_41
        -0x266f082 -> :sswitch_36
        -0x42d1a3 -> :sswitch_2b
        0x2382115 -> :sswitch_20
        0x589b15e -> :sswitch_15
        0x94e04ec -> :sswitch_9
    .end sparse-switch

    :pswitch_data_160
    .packed-switch 0x0
        :pswitch_118
        :pswitch_112
        :pswitch_10c
        :pswitch_106
        :pswitch_100
        :pswitch_fa
        :pswitch_f4
        :pswitch_ee
        :pswitch_e8
        :pswitch_e2
        :pswitch_dc
        :pswitch_d6
        :pswitch_d0
        :pswitch_ca
        :pswitch_c4
        :pswitch_be
    .end packed-switch
.end method


# virtual methods
.method public a(F)F
    .registers 5

    .line 2
    iget-object v0, p0, Lb/f/a/b/r;->a:Lb/f/a/a/b;

    float-to-double v1, p1

    const/4 p1, 0x0

    invoke-virtual {v0, v1, v2, p1}, Lb/f/a/a/b;->a(DI)D

    move-result-wide v0

    double-to-float p1, v0

    return p1
.end method

.method public a(I)V
    .registers 11

    .line 10
    iget v0, p0, Lb/f/a/b/r;->d:I

    if-nez v0, :cond_5

    return-void

    .line 11
    :cond_5
    iget-object v1, p0, Lb/f/a/b/r;->b:[I

    iget-object v2, p0, Lb/f/a/b/r;->c:[F

    const/4 v3, 0x1

    sub-int/2addr v0, v3

    const/4 v4, 0x0

    invoke-static {v1, v2, v4, v0}, Lb/f/a/b/r$m;->a([I[FII)V

    const/4 v0, 0x1

    const/4 v1, 0x1

    .line 12
    :goto_11
    iget v2, p0, Lb/f/a/b/r;->d:I

    if-ge v0, v2, :cond_24

    .line 13
    iget-object v2, p0, Lb/f/a/b/r;->b:[I

    add-int/lit8 v5, v0, -0x1

    aget v5, v2, v5

    aget v2, v2, v0

    if-eq v5, v2, :cond_21

    add-int/lit8 v1, v1, 0x1

    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    .line 14
    :cond_24
    new-array v0, v1, [D

    const/4 v2, 0x2

    new-array v2, v2, [I

    aput v3, v2, v3

    aput v1, v2, v4

    .line 15
    const-class v1, D

    invoke-static {v1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[D

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 16
    :goto_37
    iget v5, p0, Lb/f/a/b/r;->d:I

    if-ge v2, v5, :cond_64

    if-lez v2, :cond_48

    .line 17
    iget-object v5, p0, Lb/f/a/b/r;->b:[I

    aget v6, v5, v2

    add-int/lit8 v7, v2, -0x1

    aget v5, v5, v7

    if-ne v6, v5, :cond_48

    goto :goto_61

    .line 18
    :cond_48
    iget-object v5, p0, Lb/f/a/b/r;->b:[I

    aget v5, v5, v2

    int-to-double v5, v5

    const-wide v7, 0x3f847ae147ae147bL    # 0.01

    mul-double v5, v5, v7

    aput-wide v5, v0, v3

    .line 19
    aget-object v5, v1, v3

    iget-object v6, p0, Lb/f/a/b/r;->c:[F

    aget v6, v6, v2

    float-to-double v6, v6

    aput-wide v6, v5, v4

    add-int/lit8 v3, v3, 0x1

    :goto_61
    add-int/lit8 v2, v2, 0x1

    goto :goto_37

    .line 20
    :cond_64
    invoke-static {p1, v0, v1}, Lb/f/a/a/b;->a(I[D[[D)Lb/f/a/a/b;

    move-result-object p1

    iput-object p1, p0, Lb/f/a/b/r;->a:Lb/f/a/a/b;

    return-void
.end method

.method public a(IF)V
    .registers 6

    .line 4
    iget-object v0, p0, Lb/f/a/b/r;->b:[I

    array-length v1, v0

    iget v2, p0, Lb/f/a/b/r;->d:I

    add-int/lit8 v2, v2, 0x1

    if-ge v1, v2, :cond_1d

    .line 5
    array-length v1, v0

    mul-int/lit8 v1, v1, 0x2

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Lb/f/a/b/r;->b:[I

    .line 6
    iget-object v0, p0, Lb/f/a/b/r;->c:[F

    array-length v1, v0

    mul-int/lit8 v1, v1, 0x2

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v0

    iput-object v0, p0, Lb/f/a/b/r;->c:[F

    .line 7
    :cond_1d
    iget-object v0, p0, Lb/f/a/b/r;->b:[I

    iget v1, p0, Lb/f/a/b/r;->d:I

    aput p1, v0, v1

    .line 8
    iget-object p1, p0, Lb/f/a/b/r;->c:[F

    aput p2, p1, v1

    add-int/lit8 v1, v1, 0x1

    .line 9
    iput v1, p0, Lb/f/a/b/r;->d:I

    return-void
.end method

.method public abstract a(Landroid/view/View;F)V
.end method

.method public a(Ljava/lang/String;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/f/a/b/r;->e:Ljava/lang/String;

    return-void
.end method

.method public b(F)F
    .registers 5

    .line 1
    iget-object v0, p0, Lb/f/a/b/r;->a:Lb/f/a/a/b;

    float-to-double v1, p1

    const/4 p1, 0x0

    invoke-virtual {v0, v1, v2, p1}, Lb/f/a/a/b;->b(DI)D

    move-result-wide v0

    double-to-float p1, v0

    return p1
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .line 1
    iget-object v0, p0, Lb/f/a/b/r;->e:Ljava/lang/String;

    .line 2
    new-instance v1, Ljava/text/DecimalFormat;

    const-string v2, "##.##"

    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    .line 3
    :goto_a
    iget v3, p0, Lb/f/a/b/r;->d:I

    if-ge v2, v3, :cond_3f

    .line 4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "["

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lb/f/a/b/r;->b:[I

    aget v0, v0, v2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " , "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lb/f/a/b/r;->c:[F

    aget v0, v0, v2

    float-to-double v4, v0

    invoke-virtual {v1, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "] "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    :cond_3f
    return-object v0
.end method
