.class public Landroidx/appcompat/widget/ActionBarContextView$a;
.super Ljava/lang/Object;
.source "ActionBarContextView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/appcompat/widget/ActionBarContextView;->a(Lb/b/p/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/b/p/b;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/ActionBarContextView;Lb/b/p/b;)V
    .registers 3

    .line 1
    iput-object p2, p0, Landroidx/appcompat/widget/ActionBarContextView$a;->h:Lb/b/p/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 2

    .line 1
    iget-object p1, p0, Landroidx/appcompat/widget/ActionBarContextView$a;->h:Lb/b/p/b;

    invoke-virtual {p1}, Lb/b/p/b;->a()V

    return-void
.end method
