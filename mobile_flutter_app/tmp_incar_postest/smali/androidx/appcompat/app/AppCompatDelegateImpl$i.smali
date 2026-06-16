.class public Landroidx/appcompat/app/AppCompatDelegateImpl$i;
.super Ljava/lang/Object;
.source "AppCompatDelegateImpl.java"

# interfaces
.implements Lb/b/p/b$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/app/AppCompatDelegateImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "i"
.end annotation


# instance fields
.field public a:Lb/b/p/b$a;

.field public final synthetic b:Landroidx/appcompat/app/AppCompatDelegateImpl;


# direct methods
.method public constructor <init>(Landroidx/appcompat/app/AppCompatDelegateImpl;Lb/b/p/b$a;)V
    .registers 3

    .line 1
    iput-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;->b:Landroidx/appcompat/app/AppCompatDelegateImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;->a:Lb/b/p/b$a;

    return-void
.end method


# virtual methods
.method public a(Lb/b/p/b;)V
    .registers 4

    .line 4
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;->a:Lb/b/p/b$a;

    invoke-interface {v0, p1}, Lb/b/p/b$a;->a(Lb/b/p/b;)V

    .line 5
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;->b:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget-object v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_18

    .line 6
    iget-object p1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;->b:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget-object v0, v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->y:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 7
    :cond_18
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;->b:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget-object v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    if-eqz v0, :cond_3b

    .line 8
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->q()V

    .line 9
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;->b:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget-object v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-static {v0}, Lb/h/m/y;->a(Landroid/view/View;)Lb/h/m/c0;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lb/h/m/c0;->a(F)Lb/h/m/c0;

    iput-object v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl;->z:Lb/h/m/c0;

    .line 10
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;->b:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget-object p1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl;->z:Lb/h/m/c0;

    new-instance v0, Landroidx/appcompat/app/AppCompatDelegateImpl$i$a;

    invoke-direct {v0, p0}, Landroidx/appcompat/app/AppCompatDelegateImpl$i$a;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl$i;)V

    invoke-virtual {p1, v0}, Lb/h/m/c0;->a(Lb/h/m/d0;)Lb/h/m/c0;

    .line 11
    :cond_3b
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;->b:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget-object v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl;->o:Lb/b/k/b;

    if-eqz v0, :cond_46

    .line 12
    iget-object p1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Lb/b/p/b;

    invoke-interface {v0, p1}, Lb/b/k/b;->b(Lb/b/p/b;)V

    .line 13
    :cond_46
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;->b:Landroidx/appcompat/app/AppCompatDelegateImpl;

    const/4 v0, 0x0

    iput-object v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Lb/b/p/b;

    .line 14
    iget-object p1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl;->C:Landroid/view/ViewGroup;

    invoke-static {p1}, Lb/h/m/y;->P(Landroid/view/View;)V

    return-void
.end method

.method public a(Lb/b/p/b;Landroid/view/Menu;)Z
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;->b:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget-object v0, v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->C:Landroid/view/ViewGroup;

    invoke-static {v0}, Lb/h/m/y;->P(Landroid/view/View;)V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;->a:Lb/b/p/b$a;

    invoke-interface {v0, p1, p2}, Lb/b/p/b$a;->a(Lb/b/p/b;Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public a(Lb/b/p/b;Landroid/view/MenuItem;)Z
    .registers 4

    .line 3
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;->a:Lb/b/p/b$a;

    invoke-interface {v0, p1, p2}, Lb/b/p/b$a;->a(Lb/b/p/b;Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public b(Lb/b/p/b;Landroid/view/Menu;)Z
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;->a:Lb/b/p/b$a;

    invoke-interface {v0, p1, p2}, Lb/b/p/b$a;->b(Lb/b/p/b;Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method
