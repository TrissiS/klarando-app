.class public final Lc/a/b/j/b;
.super Ljava/lang/Object;
.source "BitMatrix.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public final h:I

.field public final i:I

.field public final j:I

.field public final k:[I


# direct methods
.method public constructor <init>(I)V
    .registers 2

    .line 1
    invoke-direct {p0, p1, p1}, Lc/a/b/j/b;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .registers 4

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-lt p1, v0, :cond_19

    if-lt p2, v0, :cond_19

    .line 3
    iput p1, p0, Lc/a/b/j/b;->h:I

    .line 4
    iput p2, p0, Lc/a/b/j/b;->i:I

    add-int/lit8 p1, p1, 0x1f

    .line 5
    div-int/lit8 p1, p1, 0x20

    iput p1, p0, Lc/a/b/j/b;->j:I

    mul-int p1, p1, p2

    .line 6
    new-array p1, p1, [I

    iput-object p1, p0, Lc/a/b/j/b;->k:[I

    return-void

    .line 7
    :cond_19
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Both dimensions must be greater than 0"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(III[I)V
    .registers 5

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput p1, p0, Lc/a/b/j/b;->h:I

    .line 10
    iput p2, p0, Lc/a/b/j/b;->i:I

    .line 11
    iput p3, p0, Lc/a/b/j/b;->j:I

    .line 12
    iput-object p4, p0, Lc/a/b/j/b;->k:[I

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const-string v0, "\n"

    .line 11
    invoke-virtual {p0, p1, p2, v0}, Lc/a/b/j/b;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lc/a/b/j/b;->i:I

    iget v2, p0, Lc/a/b/j/b;->h:I

    add-int/lit8 v2, v2, 0x1

    mul-int v1, v1, v2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 13
    :goto_f
    iget v3, p0, Lc/a/b/j/b;->i:I

    if-ge v2, v3, :cond_2d

    const/4 v3, 0x0

    .line 14
    :goto_14
    iget v4, p0, Lc/a/b/j/b;->h:I

    if-ge v3, v4, :cond_27

    .line 15
    invoke-virtual {p0, v3, v2}, Lc/a/b/j/b;->a(II)Z

    move-result v4

    if-eqz v4, :cond_20

    move-object v4, p1

    goto :goto_21

    :cond_20
    move-object v4, p2

    :goto_21
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    .line 16
    :cond_27
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 17
    :cond_2d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public a()V
    .registers 5

    .line 3
    iget-object v0, p0, Lc/a/b/j/b;->k:[I

    array-length v0, v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_5
    if-ge v2, v0, :cond_e

    .line 4
    iget-object v3, p0, Lc/a/b/j/b;->k:[I

    aput v1, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_e
    return-void
.end method

.method public a(IIII)V
    .registers 12

    if-ltz p2, :cond_41

    if-ltz p1, :cond_41

    const/4 v0, 0x1

    if-lt p4, v0, :cond_39

    if-lt p3, v0, :cond_39

    add-int/2addr p3, p1

    add-int/2addr p4, p2

    .line 5
    iget v1, p0, Lc/a/b/j/b;->i:I

    if-gt p4, v1, :cond_31

    iget v1, p0, Lc/a/b/j/b;->h:I

    if-gt p3, v1, :cond_31

    :goto_13
    if-ge p2, p4, :cond_30

    .line 6
    iget v1, p0, Lc/a/b/j/b;->j:I

    mul-int v1, v1, p2

    move v2, p1

    :goto_1a
    if-ge v2, p3, :cond_2d

    .line 7
    iget-object v3, p0, Lc/a/b/j/b;->k:[I

    div-int/lit8 v4, v2, 0x20

    add-int/2addr v4, v1

    aget v5, v3, v4

    and-int/lit8 v6, v2, 0x1f

    shl-int v6, v0, v6

    or-int/2addr v5, v6

    aput v5, v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    :cond_2d
    add-int/lit8 p2, p2, 0x1

    goto :goto_13

    :cond_30
    return-void

    .line 8
    :cond_31
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The region must fit inside the matrix"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 9
    :cond_39
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Height and width must be at least 1"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 10
    :cond_41
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Left and top must be nonnegative"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(II)Z
    .registers 4

    .line 1
    iget v0, p0, Lc/a/b/j/b;->j:I

    mul-int p2, p2, v0

    div-int/lit8 v0, p1, 0x20

    add-int/2addr p2, v0

    .line 2
    iget-object v0, p0, Lc/a/b/j/b;->k:[I

    aget p2, v0, p2

    and-int/lit8 p1, p1, 0x1f

    ushr-int p1, p2, p1

    const/4 p2, 0x1

    and-int/2addr p1, p2

    if-eqz p1, :cond_14

    goto :goto_15

    :cond_14
    const/4 p2, 0x0

    :goto_15
    return p2
.end method

.method public b()I
    .registers 2

    .line 3
    iget v0, p0, Lc/a/b/j/b;->i:I

    return v0
.end method

.method public b(II)V
    .registers 6

    .line 1
    iget v0, p0, Lc/a/b/j/b;->j:I

    mul-int p2, p2, v0

    div-int/lit8 v0, p1, 0x20

    add-int/2addr p2, v0

    .line 2
    iget-object v0, p0, Lc/a/b/j/b;->k:[I

    aget v1, v0, p2

    and-int/lit8 p1, p1, 0x1f

    const/4 v2, 0x1

    shl-int p1, v2, p1

    or-int/2addr p1, v1

    aput p1, v0, p2

    return-void
.end method

.method public c()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/b/j/b;->h:I

    return v0
.end method

.method public clone()Lc/a/b/j/b;
    .registers 6

    .line 2
    new-instance v0, Lc/a/b/j/b;

    iget v1, p0, Lc/a/b/j/b;->h:I

    iget v2, p0, Lc/a/b/j/b;->i:I

    iget v3, p0, Lc/a/b/j/b;->j:I

    iget-object v4, p0, Lc/a/b/j/b;->k:[I

    invoke-virtual {v4}, [I->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [I

    invoke-direct {v0, v1, v2, v3, v4}, Lc/a/b/j/b;-><init>(III[I)V

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
    invoke-virtual {p0}, Lc/a/b/j/b;->clone()Lc/a/b/j/b;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5

    .line 1
    instance-of v0, p1, Lc/a/b/j/b;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 2
    :cond_6
    check-cast p1, Lc/a/b/j/b;

    .line 3
    iget v0, p0, Lc/a/b/j/b;->h:I

    iget v2, p1, Lc/a/b/j/b;->h:I

    if-ne v0, v2, :cond_25

    iget v0, p0, Lc/a/b/j/b;->i:I

    iget v2, p1, Lc/a/b/j/b;->i:I

    if-ne v0, v2, :cond_25

    iget v0, p0, Lc/a/b/j/b;->j:I

    iget v2, p1, Lc/a/b/j/b;->j:I

    if-ne v0, v2, :cond_25

    iget-object v0, p0, Lc/a/b/j/b;->k:[I

    iget-object p1, p1, Lc/a/b/j/b;->k:[I

    .line 4
    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result p1

    if-eqz p1, :cond_25

    const/4 v1, 0x1

    :cond_25
    return v1
.end method

.method public hashCode()I
    .registers 3

    .line 1
    iget v0, p0, Lc/a/b/j/b;->h:I

    mul-int/lit8 v1, v0, 0x1f

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 2
    iget v0, p0, Lc/a/b/j/b;->i:I

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 3
    iget v0, p0, Lc/a/b/j/b;->j:I

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 4
    iget-object v0, p0, Lc/a/b/j/b;->k:[I

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    const-string v0, "X "

    const-string v1, "  "

    .line 1
    invoke-virtual {p0, v0, v1}, Lc/a/b/j/b;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
