.class public final Lc/a/b/j/a;
.super Ljava/lang/Object;
.source "BitArray.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public h:[I

.field public i:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lc/a/b/j/a;->i:I

    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 3
    iput-object v0, p0, Lc/a/b/j/a;->h:[I

    return-void
.end method

.method public constructor <init>([II)V
    .registers 3

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    iput-object p1, p0, Lc/a/b/j/a;->h:[I

    .line 6
    iput p2, p0, Lc/a/b/j/a;->i:I

    return-void
.end method

.method public static c(I)[I
    .registers 1

    add-int/lit8 p0, p0, 0x1f

    .line 1
    div-int/lit8 p0, p0, 0x20

    new-array p0, p0, [I

    return-object p0
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/b/j/a;->i:I

    return v0
.end method

.method public final a(I)V
    .registers 5

    .line 2
    iget-object v0, p0, Lc/a/b/j/a;->h:[I

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x20

    if-le p1, v0, :cond_14

    .line 3
    invoke-static {p1}, Lc/a/b/j/a;->c(I)[I

    move-result-object p1

    .line 4
    iget-object v0, p0, Lc/a/b/j/a;->h:[I

    array-length v1, v0

    const/4 v2, 0x0

    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 5
    iput-object p1, p0, Lc/a/b/j/a;->h:[I

    :cond_14
    return-void
.end method

.method public a(II)V
    .registers 5

    if-ltz p2, :cond_1f

    const/16 v0, 0x20

    if-gt p2, v0, :cond_1f

    .line 9
    iget v0, p0, Lc/a/b/j/a;->i:I

    add-int/2addr v0, p2

    invoke-virtual {p0, v0}, Lc/a/b/j/a;->a(I)V

    :goto_c
    if-lez p2, :cond_1e

    add-int/lit8 v0, p2, -0x1

    shr-int v0, p1, v0

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_17

    goto :goto_18

    :cond_17
    const/4 v1, 0x0

    .line 10
    :goto_18
    invoke-virtual {p0, v1}, Lc/a/b/j/a;->a(Z)V

    add-int/lit8 p2, p2, -0x1

    goto :goto_c

    :cond_1e
    return-void

    .line 11
    :cond_1f
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Num bits must be between 0 and 32"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(I[BII)V
    .registers 11

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    if-ge v1, p4, :cond_23

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_6
    const/16 v4, 0x8

    if-ge v2, v4, :cond_1b

    .line 15
    invoke-virtual {p0, p1}, Lc/a/b/j/a;->b(I)Z

    move-result v4

    if-eqz v4, :cond_16

    rsub-int/lit8 v4, v2, 0x7

    const/4 v5, 0x1

    shl-int v4, v5, v4

    or-int/2addr v3, v4

    :cond_16
    add-int/lit8 p1, p1, 0x1

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_1b
    add-int v2, p3, v1

    int-to-byte v3, v3

    .line 16
    aput-byte v3, p2, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_23
    return-void
.end method

.method public a(Lc/a/b/j/a;)V
    .registers 5

    .line 12
    iget v0, p1, Lc/a/b/j/a;->i:I

    .line 13
    iget v1, p0, Lc/a/b/j/a;->i:I

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lc/a/b/j/a;->a(I)V

    const/4 v1, 0x0

    :goto_9
    if-ge v1, v0, :cond_15

    .line 14
    invoke-virtual {p1, v1}, Lc/a/b/j/a;->b(I)Z

    move-result v2

    invoke-virtual {p0, v2}, Lc/a/b/j/a;->a(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_15
    return-void
.end method

.method public a(Z)V
    .registers 6

    .line 6
    iget v0, p0, Lc/a/b/j/a;->i:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lc/a/b/j/a;->a(I)V

    if-eqz p1, :cond_18

    .line 7
    iget-object p1, p0, Lc/a/b/j/a;->h:[I

    iget v0, p0, Lc/a/b/j/a;->i:I

    div-int/lit8 v2, v0, 0x20

    aget v3, p1, v2

    and-int/lit8 v0, v0, 0x1f

    shl-int v0, v1, v0

    or-int/2addr v0, v3

    aput v0, p1, v2

    .line 8
    :cond_18
    iget p1, p0, Lc/a/b/j/a;->i:I

    add-int/2addr p1, v1

    iput p1, p0, Lc/a/b/j/a;->i:I

    return-void
.end method

.method public b()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/b/j/a;->i:I

    add-int/lit8 v0, v0, 0x7

    div-int/lit8 v0, v0, 0x8

    return v0
.end method

.method public b(Lc/a/b/j/a;)V
    .registers 6

    .line 3
    iget-object v0, p0, Lc/a/b/j/a;->h:[I

    array-length v0, v0

    iget-object v1, p1, Lc/a/b/j/a;->h:[I

    array-length v1, v1

    if-ne v0, v1, :cond_1b

    const/4 v0, 0x0

    .line 4
    :goto_9
    iget-object v1, p0, Lc/a/b/j/a;->h:[I

    array-length v2, v1

    if-ge v0, v2, :cond_1a

    .line 5
    aget v2, v1, v0

    iget-object v3, p1, Lc/a/b/j/a;->h:[I

    aget v3, v3, v0

    xor-int/2addr v2, v3

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_1a
    return-void

    .line 6
    :cond_1b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Sizes don\'t match"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public b(I)Z
    .registers 4

    .line 2
    iget-object v0, p0, Lc/a/b/j/a;->h:[I

    div-int/lit8 v1, p1, 0x20

    aget v0, v0, v1

    and-int/lit8 p1, p1, 0x1f

    const/4 v1, 0x1

    shl-int p1, v1, p1

    and-int/2addr p1, v0

    if-eqz p1, :cond_f

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    :goto_10
    return v1
.end method

.method public clone()Lc/a/b/j/a;
    .registers 4

    .line 2
    new-instance v0, Lc/a/b/j/a;

    iget-object v1, p0, Lc/a/b/j/a;->h:[I

    invoke-virtual {v1}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iget v2, p0, Lc/a/b/j/a;->i:I

    invoke-direct {v0, v1, v2}, Lc/a/b/j/a;-><init>([II)V

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lc/a/b/j/a;->clone()Lc/a/b/j/a;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5

    .line 1
    instance-of v0, p1, Lc/a/b/j/a;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 2
    :cond_6
    check-cast p1, Lc/a/b/j/a;

    .line 3
    iget v0, p0, Lc/a/b/j/a;->i:I

    iget v2, p1, Lc/a/b/j/a;->i:I

    if-ne v0, v2, :cond_19

    iget-object v0, p0, Lc/a/b/j/a;->h:[I

    iget-object p1, p1, Lc/a/b/j/a;->h:[I

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result p1

    if-eqz p1, :cond_19

    const/4 v1, 0x1

    :cond_19
    return v1
.end method

.method public hashCode()I
    .registers 3

    .line 1
    iget v0, p0, Lc/a/b/j/a;->i:I

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lc/a/b/j/a;->h:[I

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lc/a/b/j/a;->i:I

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x0

    .line 2
    :goto_8
    iget v2, p0, Lc/a/b/j/a;->i:I

    if-ge v1, v2, :cond_26

    and-int/lit8 v2, v1, 0x7

    if-nez v2, :cond_15

    const/16 v2, 0x20

    .line 3
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 4
    :cond_15
    invoke-virtual {p0, v1}, Lc/a/b/j/a;->b(I)Z

    move-result v2

    if-eqz v2, :cond_1e

    const/16 v2, 0x58

    goto :goto_20

    :cond_1e
    const/16 v2, 0x2e

    :goto_20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 5
    :cond_26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
