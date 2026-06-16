.class public Lc/a/a/a/x/n;
.super Landroidx/recyclerview/widget/LinearLayoutManager;
.source "SmoothCalendarLayoutManager.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;IZ)V
    .registers 4

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    return-void
.end method


# virtual methods
.method public a(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$y;I)V
    .registers 4

    .line 1
    new-instance p2, Lc/a/a/a/x/n$a;

    .line 2
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p0, p1}, Lc/a/a/a/x/n$a;-><init>(Lc/a/a/a/x/n;Landroid/content/Context;)V

    .line 3
    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView$x;->c(I)V

    .line 4
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->b(Landroidx/recyclerview/widget/RecyclerView$x;)V

    return-void
.end method
