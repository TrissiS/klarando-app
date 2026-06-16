.class public Lc/a/a/a/x/f$g;
.super Landroidx/recyclerview/widget/RecyclerView$s;
.source "MaterialCalendar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/x/f;->a(Landroid/view/View;Lc/a/a/a/x/k;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/x/k;

.field public final synthetic b:Lcom/google/android/material/button/MaterialButton;

.field public final synthetic c:Lc/a/a/a/x/f;


# direct methods
.method public constructor <init>(Lc/a/a/a/x/f;Lc/a/a/a/x/k;Lcom/google/android/material/button/MaterialButton;)V
    .registers 4

    .line 1
    iput-object p1, p0, Lc/a/a/a/x/f$g;->c:Lc/a/a/a/x/f;

    iput-object p2, p0, Lc/a/a/a/x/f$g;->a:Lc/a/a/a/x/k;

    iput-object p3, p0, Lc/a/a/a/x/f$g;->b:Lcom/google/android/material/button/MaterialButton;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$s;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroidx/recyclerview/widget/RecyclerView;I)V
    .registers 5

    if-nez p2, :cond_17

    .line 5
    iget-object p2, p0, Lc/a/a/a/x/f$g;->b:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p2}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    .line 6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_12

    .line 7
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->announceForAccessibility(Ljava/lang/CharSequence;)V

    goto :goto_17

    :cond_12
    const/16 p2, 0x800

    .line 8
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->sendAccessibilityEvent(I)V

    :cond_17
    :goto_17
    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;II)V
    .registers 4

    if-gez p2, :cond_d

    .line 1
    iget-object p1, p0, Lc/a/a/a/x/f$g;->c:Lc/a/a/a/x/f;

    invoke-virtual {p1}, Lc/a/a/a/x/f;->D0()Landroidx/recyclerview/widget/LinearLayoutManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->H()I

    move-result p1

    goto :goto_17

    .line 2
    :cond_d
    iget-object p1, p0, Lc/a/a/a/x/f$g;->c:Lc/a/a/a/x/f;

    invoke-virtual {p1}, Lc/a/a/a/x/f;->D0()Landroidx/recyclerview/widget/LinearLayoutManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->J()I

    move-result p1

    .line 3
    :goto_17
    iget-object p2, p0, Lc/a/a/a/x/f$g;->c:Lc/a/a/a/x/f;

    iget-object p3, p0, Lc/a/a/a/x/f$g;->a:Lc/a/a/a/x/k;

    invoke-virtual {p3, p1}, Lc/a/a/a/x/k;->e(I)Lcom/google/android/material/datepicker/Month;

    move-result-object p3

    invoke-static {p2, p3}, Lc/a/a/a/x/f;->a(Lc/a/a/a/x/f;Lcom/google/android/material/datepicker/Month;)Lcom/google/android/material/datepicker/Month;

    .line 4
    iget-object p2, p0, Lc/a/a/a/x/f$g;->b:Lcom/google/android/material/button/MaterialButton;

    iget-object p3, p0, Lc/a/a/a/x/f$g;->a:Lc/a/a/a/x/k;

    invoke-virtual {p3, p1}, Lc/a/a/a/x/k;->f(I)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
