.class public Lc/a/a/a/f0/a$a;
.super Ljava/lang/Object;
.source "NavigationBarItemView.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/f0/a;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/a/a/a/f0/a;


# direct methods
.method public constructor <init>(Lc/a/a/a/f0/a;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/f0/a$a;->h:Lc/a/a/a/f0/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 1
    iget-object p1, p0, Lc/a/a/a/f0/a$a;->h:Lc/a/a/a/f0/a;

    invoke-static {p1}, Lc/a/a/a/f0/a;->a(Lc/a/a/a/f0/a;)Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_15

    .line 2
    iget-object p1, p0, Lc/a/a/a/f0/a$a;->h:Lc/a/a/a/f0/a;

    invoke-static {p1}, Lc/a/a/a/f0/a;->a(Lc/a/a/a/f0/a;)Landroid/widget/ImageView;

    move-result-object p2

    invoke-static {p1, p2}, Lc/a/a/a/f0/a;->a(Lc/a/a/a/f0/a;Landroid/view/View;)V

    :cond_15
    return-void
.end method
