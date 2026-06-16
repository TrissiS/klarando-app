.class public final Lc/a/b/m/b/a;
.super Ljava/lang/Object;
.source "BarcodeMatrix.java"


# instance fields
.field public final a:[Lc/a/b/m/b/b;

.field public b:I

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(II)V
    .registers 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-array v0, p1, [Lc/a/b/m/b/b;

    iput-object v0, p0, Lc/a/b/m/b/a;->a:[Lc/a/b/m/b/b;

    .line 3
    array-length v0, v0

    const/4 v1, 0x0

    :goto_9
    if-ge v1, v0, :cond_1d

    .line 4
    iget-object v2, p0, Lc/a/b/m/b/a;->a:[Lc/a/b/m/b/b;

    new-instance v3, Lc/a/b/m/b/b;

    add-int/lit8 v4, p2, 0x4

    mul-int/lit8 v4, v4, 0x11

    add-int/lit8 v4, v4, 0x1

    invoke-direct {v3, v4}, Lc/a/b/m/b/b;-><init>(I)V

    aput-object v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_1d
    mul-int/lit8 p2, p2, 0x11

    .line 5
    iput p2, p0, Lc/a/b/m/b/a;->d:I

    .line 6
    iput p1, p0, Lc/a/b/m/b/a;->c:I

    const/4 p1, -0x1

    .line 7
    iput p1, p0, Lc/a/b/m/b/a;->b:I

    return-void
.end method


# virtual methods
.method public a()Lc/a/b/m/b/b;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/b/m/b/a;->a:[Lc/a/b/m/b/b;

    iget v1, p0, Lc/a/b/m/b/a;->b:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method public a(II)[[B
    .registers 10

    .line 2
    iget v0, p0, Lc/a/b/m/b/a;->c:I

    mul-int v0, v0, p2

    iget v1, p0, Lc/a/b/m/b/a;->d:I

    mul-int v1, v1, p1

    const/4 v2, 0x2

    new-array v2, v2, [I

    const/4 v3, 0x1

    aput v1, v2, v3

    const/4 v1, 0x0

    aput v0, v2, v1

    const-class v0, B

    invoke-static {v0, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[B

    .line 3
    iget v2, p0, Lc/a/b/m/b/a;->c:I

    mul-int v2, v2, p2

    :goto_1d
    if-ge v1, v2, :cond_31

    sub-int v4, v2, v1

    sub-int/2addr v4, v3

    .line 4
    iget-object v5, p0, Lc/a/b/m/b/a;->a:[Lc/a/b/m/b/b;

    div-int v6, v1, p2

    aget-object v5, v5, v6

    invoke-virtual {v5, p1}, Lc/a/b/m/b/b;->a(I)[B

    move-result-object v5

    aput-object v5, v0, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_1d

    :cond_31
    return-object v0
.end method

.method public b()V
    .registers 2

    .line 1
    iget v0, p0, Lc/a/b/m/b/a;->b:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc/a/b/m/b/a;->b:I

    return-void
.end method
