.class public Lb/b/p/j/r;
.super Lb/b/p/j/g;
.source "SubMenuBuilder.java"

# interfaces
.implements Landroid/view/SubMenu;


# instance fields
.field public B:Lb/b/p/j/g;

.field public C:Lb/b/p/j/i;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lb/b/p/j/g;Lb/b/p/j/i;)V
    .registers 4

    .line 1
    invoke-direct {p0, p1}, Lb/b/p/j/g;-><init>(Landroid/content/Context;)V

    .line 2
    iput-object p2, p0, Lb/b/p/j/r;->B:Lb/b/p/j/g;

    .line 3
    iput-object p3, p0, Lb/b/p/j/r;->C:Lb/b/p/j/i;

    return-void
.end method


# virtual methods
.method public a(Lb/b/p/j/g$a;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/p/j/r;->B:Lb/b/p/j/g;

    invoke-virtual {v0, p1}, Lb/b/p/j/g;->a(Lb/b/p/j/g$a;)V

    return-void
.end method

.method public a(Lb/b/p/j/g;Landroid/view/MenuItem;)Z
    .registers 4

    .line 2
    invoke-super {p0, p1, p2}, Lb/b/p/j/g;->a(Lb/b/p/j/g;Landroid/view/MenuItem;)Z

    move-result v0

    if-nez v0, :cond_11

    iget-object v0, p0, Lb/b/p/j/r;->B:Lb/b/p/j/g;

    .line 3
    invoke-virtual {v0, p1, p2}, Lb/b/p/j/g;->a(Lb/b/p/j/g;Landroid/view/MenuItem;)Z

    move-result p1

    if-eqz p1, :cond_f

    goto :goto_11

    :cond_f
    const/4 p1, 0x0

    goto :goto_12

    :cond_11
    :goto_11
    const/4 p1, 0x1

    :goto_12
    return p1
.end method

.method public a(Lb/b/p/j/i;)Z
    .registers 3

    .line 4
    iget-object v0, p0, Lb/b/p/j/r;->B:Lb/b/p/j/g;

    invoke-virtual {v0, p1}, Lb/b/p/j/g;->a(Lb/b/p/j/i;)Z

    move-result p1

    return p1
.end method

.method public b(Lb/b/p/j/i;)Z
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/p/j/r;->B:Lb/b/p/j/g;

    invoke-virtual {v0, p1}, Lb/b/p/j/g;->b(Lb/b/p/j/i;)Z

    move-result p1

    return p1
.end method

.method public d()Ljava/lang/String;
    .registers 4

    .line 1
    iget-object v0, p0, Lb/b/p/j/r;->C:Lb/b/p/j/i;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lb/b/p/j/i;->getItemId()I

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    if-nez v0, :cond_e

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lb/b/p/j/g;->d()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItem()Landroid/view/MenuItem;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/r;->C:Lb/b/p/j/i;

    return-object v0
.end method

.method public m()Lb/b/p/j/g;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/r;->B:Lb/b/p/j/g;

    invoke-virtual {v0}, Lb/b/p/j/g;->m()Lb/b/p/j/g;

    move-result-object v0

    return-object v0
.end method

.method public o()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/r;->B:Lb/b/p/j/g;

    invoke-virtual {v0}, Lb/b/p/j/g;->o()Z

    move-result v0

    return v0
.end method

.method public p()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/r;->B:Lb/b/p/j/g;

    invoke-virtual {v0}, Lb/b/p/j/g;->p()Z

    move-result v0

    return v0
.end method

.method public q()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/r;->B:Lb/b/p/j/g;

    invoke-virtual {v0}, Lb/b/p/j/g;->q()Z

    move-result v0

    return v0
.end method

.method public setGroupDividerEnabled(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/p/j/r;->B:Lb/b/p/j/g;

    invoke-virtual {v0, p1}, Lb/b/p/j/g;->setGroupDividerEnabled(Z)V

    return-void
.end method

.method public setHeaderIcon(I)Landroid/view/SubMenu;
    .registers 2

    .line 2
    invoke-super {p0, p1}, Lb/b/p/j/g;->d(I)Lb/b/p/j/g;

    move-object p1, p0

    check-cast p1, Landroid/view/SubMenu;

    return-object p1
.end method

.method public setHeaderIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/SubMenu;
    .registers 2

    .line 1
    invoke-super {p0, p1}, Lb/b/p/j/g;->a(Landroid/graphics/drawable/Drawable;)Lb/b/p/j/g;

    move-object p1, p0

    check-cast p1, Landroid/view/SubMenu;

    return-object p1
.end method

.method public setHeaderTitle(I)Landroid/view/SubMenu;
    .registers 2

    .line 2
    invoke-super {p0, p1}, Lb/b/p/j/g;->e(I)Lb/b/p/j/g;

    move-object p1, p0

    check-cast p1, Landroid/view/SubMenu;

    return-object p1
.end method

.method public setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/SubMenu;
    .registers 2

    .line 1
    invoke-super {p0, p1}, Lb/b/p/j/g;->a(Ljava/lang/CharSequence;)Lb/b/p/j/g;

    move-object p1, p0

    check-cast p1, Landroid/view/SubMenu;

    return-object p1
.end method

.method public setHeaderView(Landroid/view/View;)Landroid/view/SubMenu;
    .registers 2

    .line 1
    invoke-super {p0, p1}, Lb/b/p/j/g;->a(Landroid/view/View;)Lb/b/p/j/g;

    move-object p1, p0

    check-cast p1, Landroid/view/SubMenu;

    return-object p1
.end method

.method public setIcon(I)Landroid/view/SubMenu;
    .registers 3

    .line 2
    iget-object v0, p0, Lb/b/p/j/r;->C:Lb/b/p/j/i;

    invoke-virtual {v0, p1}, Lb/b/p/j/i;->setIcon(I)Landroid/view/MenuItem;

    return-object p0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/SubMenu;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/p/j/r;->C:Lb/b/p/j/i;

    invoke-virtual {v0, p1}, Lb/b/p/j/i;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    return-object p0
.end method

.method public setQwertyMode(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/p/j/r;->B:Lb/b/p/j/g;

    invoke-virtual {v0, p1}, Lb/b/p/j/g;->setQwertyMode(Z)V

    return-void
.end method

.method public t()Landroid/view/Menu;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/r;->B:Lb/b/p/j/g;

    return-object v0
.end method
