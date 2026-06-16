.class public Lc/a/a/a/x/f$i;
.super Ljava/lang/Object;
.source "MaterialCalendar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/x/f;->a(Landroid/view/View;Lc/a/a/a/x/k;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/a/a/a/x/k;

.field public final synthetic i:Lc/a/a/a/x/f;


# direct methods
.method public constructor <init>(Lc/a/a/a/x/f;Lc/a/a/a/x/k;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/x/f$i;->i:Lc/a/a/a/x/f;

    iput-object p2, p0, Lc/a/a/a/x/f$i;->h:Lc/a/a/a/x/k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 1
    iget-object p1, p0, Lc/a/a/a/x/f$i;->i:Lc/a/a/a/x/f;

    invoke-virtual {p1}, Lc/a/a/a/x/f;->D0()Landroidx/recyclerview/widget/LinearLayoutManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->H()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    .line 2
    iget-object v0, p0, Lc/a/a/a/x/f$i;->i:Lc/a/a/a/x/f;

    invoke-static {v0}, Lc/a/a/a/x/f;->a(Lc/a/a/a/x/f;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$g;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$g;->b()I

    move-result v0

    if-ge p1, v0, :cond_27

    .line 3
    iget-object v0, p0, Lc/a/a/a/x/f$i;->i:Lc/a/a/a/x/f;

    iget-object v1, p0, Lc/a/a/a/x/f$i;->h:Lc/a/a/a/x/k;

    invoke-virtual {v1, p1}, Lc/a/a/a/x/k;->e(I)Lcom/google/android/material/datepicker/Month;

    move-result-object p1

    invoke-virtual {v0, p1}, Lc/a/a/a/x/f;->a(Lcom/google/android/material/datepicker/Month;)V

    :cond_27
    return-void
.end method
