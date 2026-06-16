.class public Lc/a/a/a/x/k$a;
.super Ljava/lang/Object;
.source "MonthsPagerAdapter.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/x/k;->a(Lc/a/a/a/x/k$b;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lcom/google/android/material/datepicker/MaterialCalendarGridView;

.field public final synthetic i:Lc/a/a/a/x/k;


# direct methods
.method public constructor <init>(Lc/a/a/a/x/k;Lcom/google/android/material/datepicker/MaterialCalendarGridView;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/x/k$a;->i:Lc/a/a/a/x/k;

    iput-object p2, p0, Lc/a/a/a/x/k$a;->h:Lcom/google/android/material/datepicker/MaterialCalendarGridView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lc/a/a/a/x/k$a;->h:Lcom/google/android/material/datepicker/MaterialCalendarGridView;

    invoke-virtual {p1}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lc/a/a/a/x/j;

    move-result-object p1

    invoke-virtual {p1, p3}, Lc/a/a/a/x/j;->e(I)Z

    move-result p1

    if-eqz p1, :cond_23

    .line 2
    iget-object p1, p0, Lc/a/a/a/x/k$a;->i:Lc/a/a/a/x/k;

    invoke-static {p1}, Lc/a/a/a/x/k;->a(Lc/a/a/a/x/k;)Lc/a/a/a/x/f$l;

    move-result-object p1

    iget-object p2, p0, Lc/a/a/a/x/k$a;->h:Lcom/google/android/material/datepicker/MaterialCalendarGridView;

    invoke-virtual {p2}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lc/a/a/a/x/j;

    move-result-object p2

    invoke-virtual {p2, p3}, Lc/a/a/a/x/j;->getItem(I)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide p2

    invoke-interface {p1, p2, p3}, Lc/a/a/a/x/f$l;->a(J)V

    :cond_23
    return-void
.end method
