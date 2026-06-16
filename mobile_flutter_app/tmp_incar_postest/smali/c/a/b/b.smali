.class public final Lc/a/b/b;
.super Ljava/lang/Object;
.source "Dimension.java"


# instance fields
.field public final a:I

.field public final b:I


# virtual methods
.method public a()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/b/b;->b:I

    return v0
.end method

.method public b()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/b/b;->a:I

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5

    .line 1
    instance-of v0, p1, Lc/a/b/b;

    const/4 v1, 0x0

    if-eqz v0, :cond_14

    .line 2
    check-cast p1, Lc/a/b/b;

    .line 3
    iget v0, p0, Lc/a/b/b;->a:I

    iget v2, p1, Lc/a/b/b;->a:I

    if-ne v0, v2, :cond_14

    iget v0, p0, Lc/a/b/b;->b:I

    iget p1, p1, Lc/a/b/b;->b:I

    if-ne v0, p1, :cond_14

    const/4 v1, 0x1

    :cond_14
    return v1
.end method

.method public hashCode()I
    .registers 3

    .line 1
    iget v0, p0, Lc/a/b/b;->a:I

    mul-int/lit16 v0, v0, 0x7fc9

    iget v1, p0, Lc/a/b/b;->b:I

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lc/a/b/b;->a:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lc/a/b/b;->b:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
