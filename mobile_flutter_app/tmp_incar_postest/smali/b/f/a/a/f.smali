.class public Lb/f/a/a/f;
.super Ljava/lang/Object;
.source "Oscillator.java"


# instance fields
.field public a:[F

.field public b:[D

.field public c:[D

.field public d:I

.field public e:D


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    new-array v1, v0, [F

    .line 2
    iput-object v1, p0, Lb/f/a/a/f;->a:[F

    new-array v0, v0, [D

    .line 3
    iput-object v0, p0, Lb/f/a/a/f;->b:[D

    const-wide v0, 0x401921fb54442d18L    # 6.283185307179586

    .line 4
    iput-wide v0, p0, Lb/f/a/a/f;->e:D

    return-void
.end method


# virtual methods
.method public a(D)D
    .registers 13

    const-wide/16 v0, 0x0

    cmpg-double v2, p1, v0

    if-gtz v2, :cond_c

    const-wide p1, 0x3ee4f8b588e368f1L    # 1.0E-5

    goto :goto_17

    :cond_c
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    cmpl-double v4, p1, v2

    if-ltz v4, :cond_17

    const-wide p1, 0x3feffffde7210be9L    # 0.999999

    .line 22
    :cond_17
    :goto_17
    iget-object v2, p0, Lb/f/a/a/f;->b:[D

    invoke-static {v2, p1, p2}, Ljava/util/Arrays;->binarySearch([DD)I

    move-result v2

    if-lez v2, :cond_20

    return-wide v0

    :cond_20
    if-eqz v2, :cond_42

    neg-int v0, v2

    add-int/lit8 v0, v0, -0x1

    .line 23
    iget-object v1, p0, Lb/f/a/a/f;->a:[F

    aget v2, v1, v0

    add-int/lit8 v3, v0, -0x1

    aget v4, v1, v3

    sub-float/2addr v2, v4

    float-to-double v4, v2

    iget-object v2, p0, Lb/f/a/a/f;->b:[D

    aget-wide v6, v2, v0

    aget-wide v8, v2, v3

    sub-double/2addr v6, v8

    div-double/2addr v4, v6

    mul-double p1, p1, v4

    .line 24
    aget v0, v1, v3

    float-to-double v0, v0

    aget-wide v6, v2, v3

    mul-double v4, v4, v6

    sub-double/2addr v0, v4

    add-double/2addr v0, p1

    :cond_42
    return-wide v0
.end method

.method public a()V
    .registers 18

    move-object/from16 v0, p0

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    move-wide v5, v2

    const/4 v4, 0x0

    .line 10
    :goto_7
    iget-object v7, v0, Lb/f/a/a/f;->a:[F

    array-length v8, v7

    if-ge v4, v8, :cond_13

    .line 11
    aget v7, v7, v4

    float-to-double v7, v7

    add-double/2addr v5, v7

    add-int/lit8 v4, v4, 0x1

    goto :goto_7

    :cond_13
    const/4 v4, 0x1

    move-wide v8, v2

    const/4 v7, 0x1

    .line 12
    :goto_16
    iget-object v10, v0, Lb/f/a/a/f;->a:[F

    array-length v11, v10

    const/high16 v12, 0x40000000    # 2.0f

    if-ge v7, v11, :cond_33

    add-int/lit8 v11, v7, -0x1

    .line 13
    aget v13, v10, v11

    aget v10, v10, v7

    add-float/2addr v13, v10

    div-float/2addr v13, v12

    .line 14
    iget-object v10, v0, Lb/f/a/a/f;->b:[D

    aget-wide v14, v10, v7

    aget-wide v11, v10, v11

    sub-double/2addr v14, v11

    float-to-double v10, v13

    mul-double v14, v14, v10

    add-double/2addr v8, v14

    add-int/lit8 v7, v7, 0x1

    goto :goto_16

    :cond_33
    const/4 v7, 0x0

    .line 15
    :goto_34
    iget-object v10, v0, Lb/f/a/a/f;->a:[F

    array-length v11, v10

    if-ge v7, v11, :cond_46

    .line 16
    aget v11, v10, v7

    float-to-double v13, v11

    div-double v15, v5, v8

    mul-double v13, v13, v15

    double-to-float v11, v13

    aput v11, v10, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_34

    .line 17
    :cond_46
    iget-object v5, v0, Lb/f/a/a/f;->c:[D

    aput-wide v2, v5, v1

    .line 18
    :goto_4a
    iget-object v1, v0, Lb/f/a/a/f;->a:[F

    array-length v2, v1

    if-ge v4, v2, :cond_6b

    add-int/lit8 v2, v4, -0x1

    .line 19
    aget v3, v1, v2

    aget v1, v1, v4

    add-float/2addr v3, v1

    div-float/2addr v3, v12

    .line 20
    iget-object v1, v0, Lb/f/a/a/f;->b:[D

    aget-wide v5, v1, v4

    aget-wide v7, v1, v2

    sub-double/2addr v5, v7

    .line 21
    iget-object v1, v0, Lb/f/a/a/f;->c:[D

    aget-wide v7, v1, v2

    float-to-double v2, v3

    mul-double v5, v5, v2

    add-double/2addr v7, v5

    aput-wide v7, v1, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_4a

    :cond_6b
    return-void
.end method

.method public a(DF)V
    .registers 8

    .line 2
    iget-object v0, p0, Lb/f/a/a/f;->a:[F

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    .line 3
    iget-object v1, p0, Lb/f/a/a/f;->b:[D

    invoke-static {v1, p1, p2}, Ljava/util/Arrays;->binarySearch([DD)I

    move-result v1

    if-gez v1, :cond_10

    neg-int v1, v1

    add-int/lit8 v1, v1, -0x1

    .line 4
    :cond_10
    iget-object v2, p0, Lb/f/a/a/f;->b:[D

    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([DI)[D

    move-result-object v2

    iput-object v2, p0, Lb/f/a/a/f;->b:[D

    .line 5
    iget-object v2, p0, Lb/f/a/a/f;->a:[F

    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v2

    iput-object v2, p0, Lb/f/a/a/f;->a:[F

    .line 6
    new-array v2, v0, [D

    iput-object v2, p0, Lb/f/a/a/f;->c:[D

    .line 7
    iget-object v2, p0, Lb/f/a/a/f;->b:[D

    add-int/lit8 v3, v1, 0x1

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    invoke-static {v2, v1, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 8
    iget-object v0, p0, Lb/f/a/a/f;->b:[D

    aput-wide p1, v0, v1

    .line 9
    iget-object p1, p0, Lb/f/a/a/f;->a:[F

    aput p3, p1, v1

    return-void
.end method

.method public a(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/a/a/f;->d:I

    return-void
.end method

.method public b(D)D
    .registers 13

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    const-wide/16 v2, 0x0

    cmpg-double v4, p1, v2

    if-gez v4, :cond_a

    move-wide p1, v2

    goto :goto_f

    :cond_a
    cmpl-double v4, p1, v0

    if-lez v4, :cond_f

    move-wide p1, v0

    .line 1
    :cond_f
    :goto_f
    iget-object v4, p0, Lb/f/a/a/f;->b:[D

    invoke-static {v4, p1, p2}, Ljava/util/Arrays;->binarySearch([DD)I

    move-result v4

    if-lez v4, :cond_18

    goto :goto_54

    :cond_18
    if-eqz v4, :cond_53

    neg-int v0, v4

    add-int/lit8 v0, v0, -0x1

    .line 2
    iget-object v1, p0, Lb/f/a/a/f;->a:[F

    aget v2, v1, v0

    add-int/lit8 v3, v0, -0x1

    aget v4, v1, v3

    sub-float/2addr v2, v4

    float-to-double v4, v2

    iget-object v2, p0, Lb/f/a/a/f;->b:[D

    aget-wide v6, v2, v0

    aget-wide v8, v2, v3

    sub-double/2addr v6, v8

    div-double/2addr v4, v6

    .line 3
    iget-object v0, p0, Lb/f/a/a/f;->c:[D

    aget-wide v6, v0, v3

    aget v0, v1, v3

    float-to-double v0, v0

    aget-wide v8, v2, v3

    mul-double v8, v8, v4

    sub-double/2addr v0, v8

    aget-wide v8, v2, v3

    sub-double v8, p1, v8

    mul-double v0, v0, v8

    add-double/2addr v6, v0

    mul-double p1, p1, p1

    aget-wide v0, v2, v3

    aget-wide v8, v2, v3

    mul-double v0, v0, v8

    sub-double/2addr p1, v0

    mul-double v4, v4, p1

    const-wide/high16 p1, 0x4000000000000000L    # 2.0

    div-double/2addr v4, p1

    add-double v0, v6, v4

    goto :goto_54

    :cond_53
    move-wide v0, v2

    :goto_54
    return-wide v0
.end method

.method public c(D)D
    .registers 12

    .line 1
    iget v0, p0, Lb/f/a/a/f;->d:I

    const-wide/high16 v1, 0x4000000000000000L    # 2.0

    const-wide/high16 v3, 0x4010000000000000L    # 4.0

    packed-switch v0, :pswitch_data_6e

    .line 2
    iget-wide v0, p0, Lb/f/a/a/f;->e:D

    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->a(D)D

    move-result-wide v2

    mul-double v0, v0, v2

    iget-wide v2, p0, Lb/f/a/a/f;->e:D

    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->b(D)D

    move-result-wide p1

    mul-double v2, v2, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide p1

    :goto_1d
    mul-double v0, v0, p1

    return-wide v0

    .line 3
    :pswitch_20
    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->a(D)D

    move-result-wide v5

    mul-double v5, v5, v3

    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->b(D)D

    move-result-wide p1

    mul-double p1, p1, v3

    add-double/2addr p1, v1

    rem-double/2addr p1, v3

    sub-double/2addr p1, v1

    :goto_2f
    mul-double v5, v5, p1

    return-wide v5

    .line 4
    :pswitch_32
    iget-wide v0, p0, Lb/f/a/a/f;->e:D

    neg-double v0, v0

    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->a(D)D

    move-result-wide v2

    mul-double v0, v0, v2

    iget-wide v2, p0, Lb/f/a/a/f;->e:D

    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->b(D)D

    move-result-wide p1

    mul-double v2, v2, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide p1

    goto :goto_1d

    .line 5
    :pswitch_48
    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->a(D)D

    move-result-wide p1

    neg-double p1, p1

    :goto_4d
    mul-double p1, p1, v1

    return-wide p1

    .line 6
    :pswitch_50
    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->a(D)D

    move-result-wide p1

    goto :goto_4d

    .line 7
    :pswitch_55
    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->a(D)D

    move-result-wide v5

    mul-double v5, v5, v3

    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->b(D)D

    move-result-wide p1

    mul-double p1, p1, v3

    const-wide/high16 v7, 0x4008000000000000L    # 3.0

    add-double/2addr p1, v7

    rem-double/2addr p1, v3

    sub-double/2addr p1, v1

    invoke-static {p1, p2}, Ljava/lang/Math;->signum(D)D

    move-result-wide p1

    goto :goto_2f

    :pswitch_6b
    const-wide/16 p1, 0x0

    return-wide p1

    :pswitch_data_6e
    .packed-switch 0x1
        :pswitch_6b
        :pswitch_55
        :pswitch_50
        :pswitch_48
        :pswitch_32
        :pswitch_20
    .end packed-switch
.end method

.method public d(D)D
    .registers 10

    .line 1
    iget v0, p0, Lb/f/a/a/f;->d:I

    const-wide/high16 v1, 0x4010000000000000L    # 4.0

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    packed-switch v0, :pswitch_data_66

    .line 2
    iget-wide v0, p0, Lb/f/a/a/f;->e:D

    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->b(D)D

    move-result-wide p1

    mul-double v0, v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide p1

    return-wide p1

    .line 3
    :pswitch_18
    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->b(D)D

    move-result-wide p1

    mul-double p1, p1, v1

    rem-double/2addr p1, v1

    sub-double/2addr p1, v3

    invoke-static {p1, p2}, Ljava/lang/Math;->abs(D)D

    move-result-wide p1

    sub-double p1, v5, p1

    mul-double p1, p1, p1

    :goto_28
    sub-double/2addr v5, p1

    return-wide v5

    .line 4
    :pswitch_2a
    iget-wide v0, p0, Lb/f/a/a/f;->e:D

    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->b(D)D

    move-result-wide p1

    mul-double v0, v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide p1

    return-wide p1

    .line 5
    :pswitch_37
    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->b(D)D

    move-result-wide p1

    mul-double p1, p1, v3

    add-double/2addr p1, v5

    rem-double/2addr p1, v3

    goto :goto_28

    .line 6
    :pswitch_40
    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->b(D)D

    move-result-wide p1

    mul-double p1, p1, v3

    add-double/2addr p1, v5

    rem-double/2addr p1, v3

    sub-double/2addr p1, v5

    return-wide p1

    .line 7
    :pswitch_4a
    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->b(D)D

    move-result-wide p1

    mul-double p1, p1, v1

    add-double/2addr p1, v5

    rem-double/2addr p1, v1

    sub-double/2addr p1, v3

    invoke-static {p1, p2}, Ljava/lang/Math;->abs(D)D

    move-result-wide p1

    goto :goto_28

    :pswitch_58
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    .line 8
    invoke-virtual {p0, p1, p2}, Lb/f/a/a/f;->b(D)D

    move-result-wide p1

    rem-double/2addr p1, v5

    sub-double/2addr v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->signum(D)D

    move-result-wide p1

    return-wide p1

    nop

    :pswitch_data_66
    .packed-switch 0x1
        :pswitch_58
        :pswitch_4a
        :pswitch_40
        :pswitch_37
        :pswitch_2a
        :pswitch_18
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "pos ="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/f/a/a/f;->b:[D

    invoke-static {v1}, Ljava/util/Arrays;->toString([D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " period="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/f/a/a/f;->a:[F

    invoke-static {v1}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
