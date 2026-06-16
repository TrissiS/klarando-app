.class public Lc/a/a/a/x/q$a;
.super Ljava/lang/Object;
.source "YearGridAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/x/q;->e(I)Landroid/view/View$OnClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:I

.field public final synthetic i:Lc/a/a/a/x/q;


# direct methods
.method public constructor <init>(Lc/a/a/a/x/q;I)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/x/q$a;->i:Lc/a/a/a/x/q;

    iput p2, p0, Lc/a/a/a/x/q$a;->h:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 1
    iget p1, p0, Lc/a/a/a/x/q$a;->h:I

    iget-object v0, p0, Lc/a/a/a/x/q$a;->i:Lc/a/a/a/x/q;

    invoke-static {v0}, Lc/a/a/a/x/q;->a(Lc/a/a/a/x/q;)Lc/a/a/a/x/f;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/x/f;->B0()Lcom/google/android/material/datepicker/Month;

    move-result-object v0

    iget v0, v0, Lcom/google/android/material/datepicker/Month;->i:I

    invoke-static {p1, v0}, Lcom/google/android/material/datepicker/Month;->a(II)Lcom/google/android/material/datepicker/Month;

    move-result-object p1

    .line 2
    iget-object v0, p0, Lc/a/a/a/x/q$a;->i:Lc/a/a/a/x/q;

    invoke-static {v0}, Lc/a/a/a/x/q;->a(Lc/a/a/a/x/q;)Lc/a/a/a/x/f;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/x/f;->z0()Lcom/google/android/material/datepicker/CalendarConstraints;

    move-result-object v0

    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/material/datepicker/CalendarConstraints;->a(Lcom/google/android/material/datepicker/Month;)Lcom/google/android/material/datepicker/Month;

    move-result-object p1

    .line 4
    iget-object v0, p0, Lc/a/a/a/x/q$a;->i:Lc/a/a/a/x/q;

    invoke-static {v0}, Lc/a/a/a/x/q;->a(Lc/a/a/a/x/q;)Lc/a/a/a/x/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/x/f;->a(Lcom/google/android/material/datepicker/Month;)V

    .line 5
    iget-object p1, p0, Lc/a/a/a/x/q$a;->i:Lc/a/a/a/x/q;

    invoke-static {p1}, Lc/a/a/a/x/q;->a(Lc/a/a/a/x/q;)Lc/a/a/a/x/f;

    move-result-object p1

    sget-object v0, Lc/a/a/a/x/f$k;->DAY:Lc/a/a/a/x/f$k;

    invoke-virtual {p1, v0}, Lc/a/a/a/x/f;->a(Lc/a/a/a/x/f$k;)V

    return-void
.end method
