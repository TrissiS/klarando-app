.class public Lc/a/a/a/x/f$d;
.super Ljava/lang/Object;
.source "MaterialCalendar.java"

# interfaces
.implements Lc/a/a/a/x/f$l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/x/f;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/x/f;


# direct methods
.method public constructor <init>(Lc/a/a/a/x/f;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/x/f$d;->a:Lc/a/a/a/x/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(J)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/f$d;->a:Lc/a/a/a/x/f;

    invoke-static {v0}, Lc/a/a/a/x/f;->b(Lc/a/a/a/x/f;)Lcom/google/android/material/datepicker/CalendarConstraints;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/CalendarConstraints;->e()Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;->a(J)Z

    move-result v0

    if-eqz v0, :cond_5d

    .line 2
    iget-object v0, p0, Lc/a/a/a/x/f$d;->a:Lc/a/a/a/x/f;

    invoke-static {v0}, Lc/a/a/a/x/f;->c(Lc/a/a/a/x/f;)Lcom/google/android/material/datepicker/DateSelector;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/google/android/material/datepicker/DateSelector;->b(J)V

    .line 3
    iget-object p1, p0, Lc/a/a/a/x/f$d;->a:Lc/a/a/a/x/f;

    iget-object p1, p1, Lc/a/a/a/x/m;->f0:Ljava/util/LinkedHashSet;

    invoke-virtual {p1}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_21
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lc/a/a/a/x/l;

    .line 4
    iget-object v0, p0, Lc/a/a/a/x/f$d;->a:Lc/a/a/a/x/f;

    invoke-static {v0}, Lc/a/a/a/x/f;->c(Lc/a/a/a/x/f;)Lcom/google/android/material/datepicker/DateSelector;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/material/datepicker/DateSelector;->a()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p2, v0}, Lc/a/a/a/x/l;->a(Ljava/lang/Object;)V

    goto :goto_21

    .line 5
    :cond_3b
    iget-object p1, p0, Lc/a/a/a/x/f$d;->a:Lc/a/a/a/x/f;

    invoke-static {p1}, Lc/a/a/a/x/f;->a(Lc/a/a/a/x/f;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$g;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$g;->f()V

    .line 6
    iget-object p1, p0, Lc/a/a/a/x/f$d;->a:Lc/a/a/a/x/f;

    invoke-static {p1}, Lc/a/a/a/x/f;->d(Lc/a/a/a/x/f;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object p1

    if-eqz p1, :cond_5d

    .line 7
    iget-object p1, p0, Lc/a/a/a/x/f$d;->a:Lc/a/a/a/x/f;

    invoke-static {p1}, Lc/a/a/a/x/f;->d(Lc/a/a/a/x/f;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$g;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$g;->f()V

    :cond_5d
    return-void
.end method
