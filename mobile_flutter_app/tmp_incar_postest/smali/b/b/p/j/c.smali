.class public abstract Lb/b/p/j/c;
.super Ljava/lang/Object;
.source "BaseMenuWrapper.java"


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Lb/e/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/g<",
            "Lb/h/g/a/b;",
            "Landroid/view/MenuItem;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lb/e/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/g<",
            "Lb/h/g/a/c;",
            "Landroid/view/SubMenu;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/b/p/j/c;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/MenuItem;)Landroid/view/MenuItem;
    .registers 4

    .line 1
    instance-of v0, p1, Lb/h/g/a/b;

    if-eqz v0, :cond_28

    .line 2
    move-object v0, p1

    check-cast v0, Lb/h/g/a/b;

    .line 3
    iget-object v1, p0, Lb/b/p/j/c;->b:Lb/e/g;

    if-nez v1, :cond_12

    .line 4
    new-instance v1, Lb/e/g;

    invoke-direct {v1}, Lb/e/g;-><init>()V

    iput-object v1, p0, Lb/b/p/j/c;->b:Lb/e/g;

    .line 5
    :cond_12
    iget-object v1, p0, Lb/b/p/j/c;->b:Lb/e/g;

    invoke-virtual {v1, p1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/MenuItem;

    if-nez p1, :cond_28

    .line 6
    new-instance p1, Lb/b/p/j/j;

    iget-object v1, p0, Lb/b/p/j/c;->a:Landroid/content/Context;

    invoke-direct {p1, v1, v0}, Lb/b/p/j/j;-><init>(Landroid/content/Context;Lb/h/g/a/b;)V

    .line 7
    iget-object v1, p0, Lb/b/p/j/c;->b:Lb/e/g;

    invoke-virtual {v1, v0, p1}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_28
    return-object p1
.end method

.method public final a(Landroid/view/SubMenu;)Landroid/view/SubMenu;
    .registers 4

    .line 8
    instance-of v0, p1, Lb/h/g/a/c;

    if-eqz v0, :cond_28

    .line 9
    check-cast p1, Lb/h/g/a/c;

    .line 10
    iget-object v0, p0, Lb/b/p/j/c;->c:Lb/e/g;

    if-nez v0, :cond_11

    .line 11
    new-instance v0, Lb/e/g;

    invoke-direct {v0}, Lb/e/g;-><init>()V

    iput-object v0, p0, Lb/b/p/j/c;->c:Lb/e/g;

    .line 12
    :cond_11
    iget-object v0, p0, Lb/b/p/j/c;->c:Lb/e/g;

    invoke-virtual {v0, p1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/SubMenu;

    if-nez v0, :cond_27

    .line 13
    new-instance v0, Lb/b/p/j/s;

    iget-object v1, p0, Lb/b/p/j/c;->a:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Lb/b/p/j/s;-><init>(Landroid/content/Context;Lb/h/g/a/c;)V

    .line 14
    iget-object v1, p0, Lb/b/p/j/c;->c:Lb/e/g;

    invoke-virtual {v1, p1, v0}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_27
    return-object v0

    :cond_28
    return-object p1
.end method

.method public final a(I)V
    .registers 4

    .line 15
    iget-object v0, p0, Lb/b/p/j/c;->b:Lb/e/g;

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    .line 16
    :goto_6
    iget-object v1, p0, Lb/b/p/j/c;->b:Lb/e/g;

    invoke-virtual {v1}, Lb/e/g;->size()I

    move-result v1

    if-ge v0, v1, :cond_26

    .line 17
    iget-object v1, p0, Lb/b/p/j/c;->b:Lb/e/g;

    invoke-virtual {v1, v0}, Lb/e/g;->c(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/h/g/a/b;

    invoke-interface {v1}, Landroid/view/MenuItem;->getGroupId()I

    move-result v1

    if-ne v1, p1, :cond_23

    .line 18
    iget-object v1, p0, Lb/b/p/j/c;->b:Lb/e/g;

    invoke-virtual {v1, v0}, Lb/e/g;->d(I)Ljava/lang/Object;

    add-int/lit8 v0, v0, -0x1

    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_26
    return-void
.end method

.method public final b()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/c;->b:Lb/e/g;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0}, Lb/e/g;->clear()V

    .line 3
    :cond_7
    iget-object v0, p0, Lb/b/p/j/c;->c:Lb/e/g;

    if-eqz v0, :cond_e

    .line 4
    invoke-virtual {v0}, Lb/e/g;->clear()V

    :cond_e
    return-void
.end method

.method public final b(I)V
    .registers 4

    .line 5
    iget-object v0, p0, Lb/b/p/j/c;->b:Lb/e/g;

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    .line 6
    :goto_6
    iget-object v1, p0, Lb/b/p/j/c;->b:Lb/e/g;

    invoke-virtual {v1}, Lb/e/g;->size()I

    move-result v1

    if-ge v0, v1, :cond_25

    .line 7
    iget-object v1, p0, Lb/b/p/j/c;->b:Lb/e/g;

    invoke-virtual {v1, v0}, Lb/e/g;->c(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/h/g/a/b;

    invoke-interface {v1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    if-ne v1, p1, :cond_22

    .line 8
    iget-object p1, p0, Lb/b/p/j/c;->b:Lb/e/g;

    invoke-virtual {p1, v0}, Lb/e/g;->d(I)Ljava/lang/Object;

    goto :goto_25

    :cond_22
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_25
    :goto_25
    return-void
.end method
