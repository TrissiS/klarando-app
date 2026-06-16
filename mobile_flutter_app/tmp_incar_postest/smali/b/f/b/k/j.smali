.class public Lb/f/b/k/j;
.super Lb/f/b/k/e;
.source "HelperWidget.java"

# interfaces
.implements Lb/f/b/k/i;


# instance fields
.field public D0:[Lb/f/b/k/e;

.field public E0:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lb/f/b/k/e;-><init>()V

    const/4 v0, 0x4

    new-array v0, v0, [Lb/f/b/k/e;

    .line 2
    iput-object v0, p0, Lb/f/b/k/j;->D0:[Lb/f/b/k/e;

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lb/f/b/k/j;->E0:I

    return-void
.end method


# virtual methods
.method public a()V
    .registers 3

    const/4 v0, 0x0

    .line 10
    iput v0, p0, Lb/f/b/k/j;->E0:I

    .line 11
    iget-object v0, p0, Lb/f/b/k/j;->D0:[Lb/f/b/k/e;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public a(Lb/f/b/k/e;)V
    .registers 5

    if-eq p1, p0, :cond_23

    if-nez p1, :cond_5

    goto :goto_23

    .line 1
    :cond_5
    iget v0, p0, Lb/f/b/k/j;->E0:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lb/f/b/k/j;->D0:[Lb/f/b/k/e;

    array-length v2, v1

    if-le v0, v2, :cond_19

    .line 2
    array-length v0, v1

    mul-int/lit8 v0, v0, 0x2

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb/f/b/k/e;

    iput-object v0, p0, Lb/f/b/k/j;->D0:[Lb/f/b/k/e;

    .line 3
    :cond_19
    iget-object v0, p0, Lb/f/b/k/j;->D0:[Lb/f/b/k/e;

    iget v1, p0, Lb/f/b/k/j;->E0:I

    aput-object p1, v0, v1

    add-int/lit8 v1, v1, 0x1

    .line 4
    iput v1, p0, Lb/f/b/k/j;->E0:I

    :cond_23
    :goto_23
    return-void
.end method

.method public a(Lb/f/b/k/e;Ljava/util/HashMap;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/f/b/k/e;",
            "Ljava/util/HashMap<",
            "Lb/f/b/k/e;",
            "Lb/f/b/k/e;",
            ">;)V"
        }
    .end annotation

    .line 5
    invoke-super {p0, p1, p2}, Lb/f/b/k/e;->a(Lb/f/b/k/e;Ljava/util/HashMap;)V

    .line 6
    check-cast p1, Lb/f/b/k/j;

    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lb/f/b/k/j;->E0:I

    .line 8
    iget v1, p1, Lb/f/b/k/j;->E0:I

    :goto_a
    if-ge v0, v1, :cond_1c

    .line 9
    iget-object v2, p1, Lb/f/b/k/j;->D0:[Lb/f/b/k/e;

    aget-object v2, v2, v0

    invoke-virtual {p2, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/e;

    invoke-virtual {p0, v2}, Lb/f/b/k/j;->a(Lb/f/b/k/e;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    :cond_1c
    return-void
.end method

.method public a(Lb/f/b/k/f;)V
    .registers 2

    return-void
.end method
