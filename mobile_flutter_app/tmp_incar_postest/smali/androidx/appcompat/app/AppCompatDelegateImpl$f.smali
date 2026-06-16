.class public Landroidx/appcompat/app/AppCompatDelegateImpl$f;
.super Ljava/lang/Object;
.source "AppCompatDelegateImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/appcompat/app/AppCompatDelegateImpl;->b(Lb/b/p/b$a;)Lb/b/p/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Landroidx/appcompat/app/AppCompatDelegateImpl;


# direct methods
.method public constructor <init>(Landroidx/appcompat/app/AppCompatDelegateImpl;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$f;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$f;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget-object v1, v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/widget/PopupWindow;

    iget-object v0, v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    const/4 v2, 0x0

    const/16 v3, 0x37

    invoke-virtual {v1, v0, v3, v2, v2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$f;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->q()V

    .line 3
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$f;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->B()Z

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    if-eqz v0, :cond_3d

    .line 4
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$f;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget-object v0, v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 5
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$f;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget-object v2, v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-static {v2}, Lb/h/m/y;->a(Landroid/view/View;)Lb/h/m/c0;

    move-result-object v2

    invoke-virtual {v2, v1}, Lb/h/m/c0;->a(F)Lb/h/m/c0;

    iput-object v2, v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->z:Lb/h/m/c0;

    .line 6
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$f;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget-object v0, v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->z:Lb/h/m/c0;

    new-instance v1, Landroidx/appcompat/app/AppCompatDelegateImpl$f$a;

    invoke-direct {v1, p0}, Landroidx/appcompat/app/AppCompatDelegateImpl$f$a;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl$f;)V

    invoke-virtual {v0, v1}, Lb/h/m/c0;->a(Lb/h/m/d0;)Lb/h/m/c0;

    goto :goto_4b

    .line 7
    :cond_3d
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$f;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget-object v0, v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 8
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$f;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget-object v0, v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/ActionBarContextView;->setVisibility(I)V

    :goto_4b
    return-void
.end method
