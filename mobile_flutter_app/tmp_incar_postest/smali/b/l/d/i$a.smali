.class public Lb/l/d/i$a;
.super Ljava/lang/Object;
.source "FragmentLayoutInflaterFactory.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/i;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/l/d/o;

.field public final synthetic i:Lb/l/d/i;


# direct methods
.method public constructor <init>(Lb/l/d/i;Lb/l/d/o;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lb/l/d/i$a;->i:Lb/l/d/i;

    iput-object p2, p0, Lb/l/d/i$a;->h:Lb/l/d/o;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lb/l/d/i$a;->h:Lb/l/d/o;

    invoke-virtual {p1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object p1

    .line 2
    iget-object v0, p0, Lb/l/d/i$a;->h:Lb/l/d/o;

    invoke-virtual {v0}, Lb/l/d/o;->l()V

    .line 3
    iget-object p1, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iget-object v0, p0, Lb/l/d/i$a;->i:Lb/l/d/i;

    iget-object v0, v0, Lb/l/d/i;->h:Landroidx/fragment/app/FragmentManager;

    invoke-static {p1, v0}, Lb/l/d/w;->a(Landroid/view/ViewGroup;Landroidx/fragment/app/FragmentManager;)Lb/l/d/w;

    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lb/l/d/w;->b()V

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    return-void
.end method
