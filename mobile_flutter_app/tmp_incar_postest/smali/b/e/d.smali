.class public Lb/e/d;
.super Ljava/lang/Object;
.source "LongSparseArray.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field public static final l:Ljava/lang/Object;


# instance fields
.field public h:Z

.field public i:[J

.field public j:[Ljava/lang/Object;

.field public k:I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lb/e/d;->l:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    const/16 v0, 0xa

    .line 1
    invoke-direct {p0, v0}, Lb/e/d;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .registers 3

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lb/e/d;->h:Z

    if-nez p1, :cond_11

    .line 4
    sget-object p1, Lb/e/c;->b:[J

    iput-object p1, p0, Lb/e/d;->i:[J

    .line 5
    sget-object p1, Lb/e/c;->c:[Ljava/lang/Object;

    iput-object p1, p0, Lb/e/d;->j:[Ljava/lang/Object;

    goto :goto_1d

    .line 6
    :cond_11
    invoke-static {p1}, Lb/e/c;->c(I)I

    move-result p1

    .line 7
    new-array v0, p1, [J

    iput-object v0, p0, Lb/e/d;->i:[J

    .line 8
    new-array p1, p1, [Ljava/lang/Object;

    iput-object p1, p0, Lb/e/d;->j:[Ljava/lang/Object;

    :goto_1d
    return-void
.end method


# virtual methods
.method public a(I)J
    .registers 5

    .line 2
    iget-boolean v0, p0, Lb/e/d;->h:Z

    if-eqz v0, :cond_7

    .line 3
    invoke-virtual {p0}, Lb/e/d;->b()V

    .line 4
    :cond_7
    iget-object v0, p0, Lb/e/d;->i:[J

    aget-wide v1, v0, p1

    return-wide v1
.end method

.method public a(J)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TE;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, p2, v0}, Lb/e/d;->b(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public a()V
    .registers 6

    .line 5
    iget v0, p0, Lb/e/d;->k:I

    .line 6
    iget-object v1, p0, Lb/e/d;->j:[Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_6
    if-ge v3, v0, :cond_e

    const/4 v4, 0x0

    .line 7
    aput-object v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 8
    :cond_e
    iput v2, p0, Lb/e/d;->k:I

    .line 9
    iput-boolean v2, p0, Lb/e/d;->h:Z

    return-void
.end method

.method public a(JLjava/lang/Object;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTE;)V"
        }
    .end annotation

    .line 10
    iget v0, p0, Lb/e/d;->k:I

    if-eqz v0, :cond_12

    iget-object v1, p0, Lb/e/d;->i:[J

    add-int/lit8 v0, v0, -0x1

    aget-wide v0, v1, v0

    cmp-long v2, p1, v0

    if-gtz v2, :cond_12

    .line 11
    invoke-virtual {p0, p1, p2, p3}, Lb/e/d;->c(JLjava/lang/Object;)V

    return-void

    .line 12
    :cond_12
    iget-boolean v0, p0, Lb/e/d;->h:Z

    if-eqz v0, :cond_20

    iget v0, p0, Lb/e/d;->k:I

    iget-object v1, p0, Lb/e/d;->i:[J

    array-length v1, v1

    if-lt v0, v1, :cond_20

    .line 13
    invoke-virtual {p0}, Lb/e/d;->b()V

    .line 14
    :cond_20
    iget v0, p0, Lb/e/d;->k:I

    .line 15
    iget-object v1, p0, Lb/e/d;->i:[J

    array-length v1, v1

    if-lt v0, v1, :cond_42

    add-int/lit8 v1, v0, 0x1

    .line 16
    invoke-static {v1}, Lb/e/c;->c(I)I

    move-result v1

    .line 17
    new-array v2, v1, [J

    .line 18
    new-array v1, v1, [Ljava/lang/Object;

    .line 19
    iget-object v3, p0, Lb/e/d;->i:[J

    array-length v4, v3

    const/4 v5, 0x0

    invoke-static {v3, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 20
    iget-object v3, p0, Lb/e/d;->j:[Ljava/lang/Object;

    array-length v4, v3

    invoke-static {v3, v5, v1, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 21
    iput-object v2, p0, Lb/e/d;->i:[J

    .line 22
    iput-object v1, p0, Lb/e/d;->j:[Ljava/lang/Object;

    .line 23
    :cond_42
    iget-object v1, p0, Lb/e/d;->i:[J

    aput-wide p1, v1, v0

    .line 24
    iget-object p1, p0, Lb/e/d;->j:[Ljava/lang/Object;

    aput-object p3, p1, v0

    add-int/lit8 v0, v0, 0x1

    .line 25
    iput v0, p0, Lb/e/d;->k:I

    return-void
.end method

.method public b(J)I
    .registers 5

    .line 17
    iget-boolean v0, p0, Lb/e/d;->h:Z

    if-eqz v0, :cond_7

    .line 18
    invoke-virtual {p0}, Lb/e/d;->b()V

    .line 19
    :cond_7
    iget-object v0, p0, Lb/e/d;->i:[J

    iget v1, p0, Lb/e/d;->k:I

    invoke-static {v0, v1, p1, p2}, Lb/e/c;->a([JIJ)I

    move-result p1

    return p1
.end method

.method public b(JLjava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTE;)TE;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/e/d;->i:[J

    iget v1, p0, Lb/e/d;->k:I

    invoke-static {v0, v1, p1, p2}, Lb/e/c;->a([JIJ)I

    move-result p1

    if-ltz p1, :cond_16

    .line 2
    iget-object p2, p0, Lb/e/d;->j:[Ljava/lang/Object;

    aget-object v0, p2, p1

    sget-object v1, Lb/e/d;->l:Ljava/lang/Object;

    if-ne v0, v1, :cond_13

    goto :goto_16

    .line 3
    :cond_13
    aget-object p1, p2, p1

    return-object p1

    :cond_16
    :goto_16
    return-object p3
.end method

.method public final b()V
    .registers 10

    .line 7
    iget v0, p0, Lb/e/d;->k:I

    .line 8
    iget-object v1, p0, Lb/e/d;->i:[J

    .line 9
    iget-object v2, p0, Lb/e/d;->j:[Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_9
    if-ge v4, v0, :cond_21

    .line 10
    aget-object v6, v2, v4

    .line 11
    sget-object v7, Lb/e/d;->l:Ljava/lang/Object;

    if-eq v6, v7, :cond_1e

    if-eq v4, v5, :cond_1c

    .line 12
    aget-wide v7, v1, v4

    aput-wide v7, v1, v5

    .line 13
    aput-object v6, v2, v5

    const/4 v6, 0x0

    .line 14
    aput-object v6, v2, v4

    :cond_1c
    add-int/lit8 v5, v5, 0x1

    :cond_1e
    add-int/lit8 v4, v4, 0x1

    goto :goto_9

    .line 15
    :cond_21
    iput-boolean v3, p0, Lb/e/d;->h:Z

    .line 16
    iput v5, p0, Lb/e/d;->k:I

    return-void
.end method

.method public b(I)V
    .registers 5

    .line 4
    iget-object v0, p0, Lb/e/d;->j:[Ljava/lang/Object;

    aget-object v1, v0, p1

    sget-object v2, Lb/e/d;->l:Ljava/lang/Object;

    if-eq v1, v2, :cond_d

    .line 5
    aput-object v2, v0, p1

    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Lb/e/d;->h:Z

    :cond_d
    return-void
.end method

.method public c()I
    .registers 2

    .line 27
    iget-boolean v0, p0, Lb/e/d;->h:Z

    if-eqz v0, :cond_7

    .line 28
    invoke-virtual {p0}, Lb/e/d;->b()V

    .line 29
    :cond_7
    iget v0, p0, Lb/e/d;->k:I

    return v0
.end method

.method public c(I)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 30
    iget-boolean v0, p0, Lb/e/d;->h:Z

    if-eqz v0, :cond_7

    .line 31
    invoke-virtual {p0}, Lb/e/d;->b()V

    .line 32
    :cond_7
    iget-object v0, p0, Lb/e/d;->j:[Ljava/lang/Object;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public c(J)V
    .registers 5

    .line 1
    iget-object v0, p0, Lb/e/d;->i:[J

    iget v1, p0, Lb/e/d;->k:I

    invoke-static {v0, v1, p1, p2}, Lb/e/c;->a([JIJ)I

    move-result p1

    if-ltz p1, :cond_17

    .line 2
    iget-object p2, p0, Lb/e/d;->j:[Ljava/lang/Object;

    aget-object v0, p2, p1

    sget-object v1, Lb/e/d;->l:Ljava/lang/Object;

    if-eq v0, v1, :cond_17

    .line 3
    aput-object v1, p2, p1

    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lb/e/d;->h:Z

    :cond_17
    return-void
.end method

.method public c(JLjava/lang/Object;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTE;)V"
        }
    .end annotation

    .line 5
    iget-object v0, p0, Lb/e/d;->i:[J

    iget v1, p0, Lb/e/d;->k:I

    invoke-static {v0, v1, p1, p2}, Lb/e/c;->a([JIJ)I

    move-result v0

    if-ltz v0, :cond_f

    .line 6
    iget-object p1, p0, Lb/e/d;->j:[Ljava/lang/Object;

    aput-object p3, p1, v0

    goto :goto_80

    :cond_f
    not-int v0, v0

    .line 7
    iget v1, p0, Lb/e/d;->k:I

    if-ge v0, v1, :cond_23

    iget-object v1, p0, Lb/e/d;->j:[Ljava/lang/Object;

    aget-object v2, v1, v0

    sget-object v3, Lb/e/d;->l:Ljava/lang/Object;

    if-ne v2, v3, :cond_23

    .line 8
    iget-object v2, p0, Lb/e/d;->i:[J

    aput-wide p1, v2, v0

    .line 9
    aput-object p3, v1, v0

    return-void

    .line 10
    :cond_23
    iget-boolean v1, p0, Lb/e/d;->h:Z

    if-eqz v1, :cond_3a

    iget v1, p0, Lb/e/d;->k:I

    iget-object v2, p0, Lb/e/d;->i:[J

    array-length v2, v2

    if-lt v1, v2, :cond_3a

    .line 11
    invoke-virtual {p0}, Lb/e/d;->b()V

    .line 12
    iget-object v0, p0, Lb/e/d;->i:[J

    iget v1, p0, Lb/e/d;->k:I

    invoke-static {v0, v1, p1, p2}, Lb/e/c;->a([JIJ)I

    move-result v0

    not-int v0, v0

    .line 13
    :cond_3a
    iget v1, p0, Lb/e/d;->k:I

    iget-object v2, p0, Lb/e/d;->i:[J

    array-length v2, v2

    if-lt v1, v2, :cond_5c

    add-int/lit8 v1, v1, 0x1

    .line 14
    invoke-static {v1}, Lb/e/c;->c(I)I

    move-result v1

    .line 15
    new-array v2, v1, [J

    .line 16
    new-array v1, v1, [Ljava/lang/Object;

    .line 17
    iget-object v3, p0, Lb/e/d;->i:[J

    array-length v4, v3

    const/4 v5, 0x0

    invoke-static {v3, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 18
    iget-object v3, p0, Lb/e/d;->j:[Ljava/lang/Object;

    array-length v4, v3

    invoke-static {v3, v5, v1, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 19
    iput-object v2, p0, Lb/e/d;->i:[J

    .line 20
    iput-object v1, p0, Lb/e/d;->j:[Ljava/lang/Object;

    .line 21
    :cond_5c
    iget v1, p0, Lb/e/d;->k:I

    sub-int v2, v1, v0

    if-eqz v2, :cond_72

    .line 22
    iget-object v2, p0, Lb/e/d;->i:[J

    add-int/lit8 v3, v0, 0x1

    sub-int/2addr v1, v0

    invoke-static {v2, v0, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 23
    iget-object v1, p0, Lb/e/d;->j:[Ljava/lang/Object;

    iget v2, p0, Lb/e/d;->k:I

    sub-int/2addr v2, v0

    invoke-static {v1, v0, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 24
    :cond_72
    iget-object v1, p0, Lb/e/d;->i:[J

    aput-wide p1, v1, v0

    .line 25
    iget-object p1, p0, Lb/e/d;->j:[Ljava/lang/Object;

    aput-object p3, p1, v0

    .line 26
    iget p1, p0, Lb/e/d;->k:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lb/e/d;->k:I

    :goto_80
    return-void
.end method

.method public clone()Lb/e/d;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lb/e/d<",
            "TE;>;"
        }
    .end annotation

    .line 2
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/e/d;

    .line 3
    iget-object v1, p0, Lb/e/d;->i:[J

    invoke-virtual {v1}, [J->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [J

    iput-object v1, v0, Lb/e/d;->i:[J

    .line 4
    iget-object v1, p0, Lb/e/d;->j:[Ljava/lang/Object;

    invoke-virtual {v1}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    iput-object v1, v0, Lb/e/d;->j:[Ljava/lang/Object;
    :try_end_1a
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_1a} :catch_1b

    return-object v0

    :catch_1b
    move-exception v0

    .line 5
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lb/e/d;->clone()Lb/e/d;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .line 1
    invoke-virtual {p0}, Lb/e/d;->c()I

    move-result v0

    if-gtz v0, :cond_9

    const-string v0, "{}"

    return-object v0

    .line 2
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lb/e/d;->k:I

    mul-int/lit8 v1, v1, 0x1c

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/16 v1, 0x7b

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    .line 4
    :goto_18
    iget v2, p0, Lb/e/d;->k:I

    if-ge v1, v2, :cond_41

    if-lez v1, :cond_23

    const-string v2, ", "

    .line 5
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6
    :cond_23
    invoke-virtual {p0, v1}, Lb/e/d;->a(I)J

    move-result-wide v2

    .line 7
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 v2, 0x3d

    .line 8
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 9
    invoke-virtual {p0, v1}, Lb/e/d;->c(I)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, p0, :cond_39

    .line 10
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_3e

    :cond_39
    const-string v2, "(this Map)"

    .line 11
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_3e
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    :cond_41
    const/16 v1, 0x7d

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
