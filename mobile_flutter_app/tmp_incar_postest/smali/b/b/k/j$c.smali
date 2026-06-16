.class public Lb/b/k/j$c;
.super Ljava/lang/Object;
.source "WindowDecorActionBar.java"

# interfaces
.implements Lb/h/m/f0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/k/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lb/b/k/j;


# direct methods
.method public constructor <init>(Lb/b/k/j;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/b/k/j$c;->a:Lb/b/k/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)V
    .registers 2

    .line 1
    iget-object p1, p0, Lb/b/k/j$c;->a:Lb/b/k/j;

    iget-object p1, p1, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    .line 2
    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    return-void
.end method
