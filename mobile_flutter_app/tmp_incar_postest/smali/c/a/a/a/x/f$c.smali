.class public Lc/a/a/a/x/f$c;
.super Lc/a/a/a/x/n;
.source "MaterialCalendar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/x/f;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic I:I

.field public final synthetic J:Lc/a/a/a/x/f;


# direct methods
.method public constructor <init>(Lc/a/a/a/x/f;Landroid/content/Context;IZI)V
    .registers 6

    .line 1
    iput-object p1, p0, Lc/a/a/a/x/f$c;->J:Lc/a/a/a/x/f;

    iput p5, p0, Lc/a/a/a/x/f$c;->I:I

    invoke-direct {p0, p2, p3, p4}, Lc/a/a/a/x/n;-><init>(Landroid/content/Context;IZ)V

    return-void
.end method


# virtual methods
.method public a(Landroidx/recyclerview/widget/RecyclerView$y;[I)V
    .registers 5

    .line 1
    iget p1, p0, Lc/a/a/a/x/f$c;->I:I

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_1f

    .line 2
    iget-object p1, p0, Lc/a/a/a/x/f$c;->J:Lc/a/a/a/x/f;

    invoke-static {p1}, Lc/a/a/a/x/f;->a(Lc/a/a/a/x/f;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    move-result p1

    aput p1, p2, v1

    .line 3
    iget-object p1, p0, Lc/a/a/a/x/f$c;->J:Lc/a/a/a/x/f;

    invoke-static {p1}, Lc/a/a/a/x/f;->a(Lc/a/a/a/x/f;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    move-result p1

    aput p1, p2, v0

    goto :goto_37

    .line 4
    :cond_1f
    iget-object p1, p0, Lc/a/a/a/x/f$c;->J:Lc/a/a/a/x/f;

    invoke-static {p1}, Lc/a/a/a/x/f;->a(Lc/a/a/a/x/f;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    move-result p1

    aput p1, p2, v1

    .line 5
    iget-object p1, p0, Lc/a/a/a/x/f$c;->J:Lc/a/a/a/x/f;

    invoke-static {p1}, Lc/a/a/a/x/f;->a(Lc/a/a/a/x/f;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    move-result p1

    aput p1, p2, v0

    :goto_37
    return-void
.end method
