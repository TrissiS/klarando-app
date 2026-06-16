.class public Lb/l/d/w$d;
.super Lb/l/d/w$e;
.source "SpecialEffectsController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/l/d/w;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public final h:Lb/l/d/o;


# direct methods
.method public constructor <init>(Lb/l/d/w$e$c;Lb/l/d/w$e$b;Lb/l/d/o;Lb/h/i/b;)V
    .registers 6

    .line 1
    invoke-virtual {p3}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0, p4}, Lb/l/d/w$e;-><init>(Lb/l/d/w$e$c;Lb/l/d/w$e$b;Landroidx/fragment/app/Fragment;Lb/h/i/b;)V

    .line 2
    iput-object p3, p0, Lb/l/d/w$d;->h:Lb/l/d/o;

    return-void
.end method


# virtual methods
.method public b()V
    .registers 2

    .line 1
    invoke-super {p0}, Lb/l/d/w$e;->b()V

    .line 2
    iget-object v0, p0, Lb/l/d/w$d;->h:Lb/l/d/o;

    invoke-virtual {v0}, Lb/l/d/o;->l()V

    return-void
.end method

.method public h()V
    .registers 5

    .line 1
    invoke-virtual {p0}, Lb/l/d/w$e;->e()Lb/l/d/w$e$b;

    move-result-object v0

    sget-object v1, Lb/l/d/w$e$b;->ADDING:Lb/l/d/w$e$b;

    if-ne v0, v1, :cond_6e

    .line 2
    iget-object v0, p0, Lb/l/d/w$d;->h:Lb/l/d/o;

    invoke-virtual {v0}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 3
    iget-object v1, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->findFocus()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_3e

    .line 4
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->c(Landroid/view/View;)V

    const/4 v2, 0x2

    .line 5
    invoke-static {v2}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "requestFocus: Saved focused view "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " for Fragment "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "FragmentManager"

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 7
    :cond_3e
    invoke-virtual {p0}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->u0()Landroid/view/View;

    move-result-object v1

    .line 8
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_55

    .line 9
    iget-object v2, p0, Lb/l/d/w$d;->h:Lb/l/d/o;

    invoke-virtual {v2}, Lb/l/d/o;->b()V

    .line 10
    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 11
    :cond_55
    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    move-result v2

    cmpl-float v2, v2, v3

    if-nez v2, :cond_67

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_67

    const/4 v2, 0x4

    .line 12
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 13
    :cond_67
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->E()F

    move-result v0

    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    :cond_6e
    return-void
.end method
