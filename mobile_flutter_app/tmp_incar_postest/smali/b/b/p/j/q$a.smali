.class public Lb/b/p/j/q$a;
.super Ljava/lang/Object;
.source "StandardMenuPopup.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/p/j/q;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/b/p/j/q;


# direct methods
.method public constructor <init>(Lb/b/p/j/q;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/b/p/j/q$a;->h:Lb/b/p/j/q;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/q$a;->h:Lb/b/p/j/q;

    invoke-virtual {v0}, Lb/b/p/j/q;->b()Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lb/b/p/j/q$a;->h:Lb/b/p/j/q;

    iget-object v0, v0, Lb/b/p/j/q;->p:Lb/b/q/v;

    invoke-virtual {v0}, Landroidx/appcompat/widget/ListPopupWindow;->p()Z

    move-result v0

    if-nez v0, :cond_2c

    .line 2
    iget-object v0, p0, Lb/b/p/j/q$a;->h:Lb/b/p/j/q;

    iget-object v0, v0, Lb/b/p/j/q;->u:Landroid/view/View;

    if-eqz v0, :cond_27

    .line 3
    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-nez v0, :cond_1f

    goto :goto_27

    .line 4
    :cond_1f
    iget-object v0, p0, Lb/b/p/j/q$a;->h:Lb/b/p/j/q;

    iget-object v0, v0, Lb/b/p/j/q;->p:Lb/b/q/v;

    invoke-virtual {v0}, Landroidx/appcompat/widget/ListPopupWindow;->show()V

    goto :goto_2c

    .line 5
    :cond_27
    :goto_27
    iget-object v0, p0, Lb/b/p/j/q$a;->h:Lb/b/p/j/q;

    invoke-virtual {v0}, Lb/b/p/j/q;->dismiss()V

    :cond_2c
    :goto_2c
    return-void
.end method
