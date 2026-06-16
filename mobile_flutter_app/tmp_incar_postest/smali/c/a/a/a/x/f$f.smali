.class public Lc/a/a/a/x/f$f;
.super Lb/h/m/a;
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
.field public final synthetic d:Lc/a/a/a/x/f;


# direct methods
.method public constructor <init>(Lc/a/a/a/x/f;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/x/f$f;->d:Lc/a/a/a/x/f;

    invoke-direct {p0}, Lb/h/m/a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Lb/h/m/h0/c;)V
    .registers 4

    .line 1
    invoke-super {p0, p1, p2}, Lb/h/m/a;->a(Landroid/view/View;Lb/h/m/h0/c;)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/x/f$f;->d:Lc/a/a/a/x/f;

    .line 3
    invoke-static {p1}, Lc/a/a/a/x/f;->f(Lc/a/a/a/x/f;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_18

    iget-object p1, p0, Lc/a/a/a/x/f$f;->d:Lc/a/a/a/x/f;

    sget v0, Lc/a/a/a/j;->mtrl_picker_toggle_to_year_selection:I

    .line 4
    invoke-virtual {p1, v0}, Landroidx/fragment/app/Fragment;->a(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_20

    :cond_18
    iget-object p1, p0, Lc/a/a/a/x/f$f;->d:Lc/a/a/a/x/f;

    sget v0, Lc/a/a/a/j;->mtrl_picker_toggle_to_day_selection:I

    .line 5
    invoke-virtual {p1, v0}, Landroidx/fragment/app/Fragment;->a(I)Ljava/lang/String;

    move-result-object p1

    .line 6
    :goto_20
    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->d(Ljava/lang/CharSequence;)V

    return-void
.end method
