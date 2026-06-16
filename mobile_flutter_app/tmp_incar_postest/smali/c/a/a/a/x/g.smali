.class public final Lc/a/a/a/x/g;
.super Lb/l/d/c;
.source "MaterialDatePicker.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Ljava/lang/Object;",
        ">",
        "Lb/l/d/c;"
    }
.end annotation


# static fields
.field public static final M0:Ljava/lang/Object;

.field public static final N0:Ljava/lang/Object;

.field public static final O0:Ljava/lang/Object;


# instance fields
.field public A0:Lcom/google/android/material/datepicker/DateSelector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/material/datepicker/DateSelector<",
            "TS;>;"
        }
    .end annotation
.end field

.field public B0:Lc/a/a/a/x/m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lc/a/a/a/x/m<",
            "TS;>;"
        }
    .end annotation
.end field

.field public C0:Lcom/google/android/material/datepicker/CalendarConstraints;

.field public D0:Lc/a/a/a/x/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lc/a/a/a/x/f<",
            "TS;>;"
        }
    .end annotation
.end field

.field public E0:I

.field public F0:Ljava/lang/CharSequence;

.field public G0:Z

.field public H0:I

.field public I0:Landroid/widget/TextView;

.field public J0:Lcom/google/android/material/internal/CheckableImageButton;

.field public K0:Lc/a/a/a/l0/h;

.field public L0:Landroid/widget/Button;

.field public final v0:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Lc/a/a/a/x/h<",
            "-TS;>;>;"
        }
    .end annotation
.end field

.field public final w0:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Landroid/view/View$OnClickListener;",
            ">;"
        }
    .end annotation
.end field

.field public final x0:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Landroid/content/DialogInterface$OnCancelListener;",
            ">;"
        }
    .end annotation
.end field

.field public final y0:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Landroid/content/DialogInterface$OnDismissListener;",
            ">;"
        }
    .end annotation
.end field

.field public z0:I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const-string v0, "CONFIRM_BUTTON_TAG"

    .line 1
    sput-object v0, Lc/a/a/a/x/g;->M0:Ljava/lang/Object;

    const-string v0, "CANCEL_BUTTON_TAG"

    .line 2
    sput-object v0, Lc/a/a/a/x/g;->N0:Ljava/lang/Object;

    const-string v0, "TOGGLE_BUTTON_TAG"

    .line 3
    sput-object v0, Lc/a/a/a/x/g;->O0:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lb/l/d/c;-><init>()V

    .line 2
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lc/a/a/a/x/g;->v0:Ljava/util/LinkedHashSet;

    .line 3
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lc/a/a/a/x/g;->w0:Ljava/util/LinkedHashSet;

    .line 4
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lc/a/a/a/x/g;->x0:Ljava/util/LinkedHashSet;

    .line 5
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lc/a/a/a/x/g;->y0:Ljava/util/LinkedHashSet;

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/x/g;)Ljava/util/LinkedHashSet;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/x/g;->v0:Ljava/util/LinkedHashSet;

    return-object p0
.end method

.method public static synthetic a(Lc/a/a/a/x/g;Lcom/google/android/material/internal/CheckableImageButton;)V
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Lc/a/a/a/x/g;->a(Lcom/google/android/material/internal/CheckableImageButton;)V

    return-void
.end method

.method public static a(Landroid/content/Context;I)Z
    .registers 5

    .line 39
    sget v0, Lc/a/a/a/b;->materialCalendarStyle:I

    const-class v1, Lc/a/a/a/x/f;

    .line 40
    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    .line 41
    invoke-static {p0, v0, v1}, Lc/a/a/a/i0/b;->a(Landroid/content/Context;ILjava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    .line 42
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p0

    .line 43
    invoke-virtual {p0, v2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    .line 44
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    return p1
.end method

.method public static synthetic b(Lc/a/a/a/x/g;)Ljava/util/LinkedHashSet;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/x/g;->w0:Ljava/util/LinkedHashSet;

    return-object p0
.end method

.method public static synthetic c(Lc/a/a/a/x/g;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/x/g;->F0()V

    return-void
.end method

.method public static d(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 5

    .line 2
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    const/4 v1, 0x1

    new-array v1, v1, [I

    const v2, 0x10100a0

    const/4 v3, 0x0

    aput v2, v1, v3

    .line 3
    sget v2, Lc/a/a/a/e;->material_ic_calendar_black_24dp:I

    .line 4
    invoke-static {p0, v2}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 5
    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array v1, v3, [I

    .line 6
    sget v2, Lc/a/a/a/e;->material_ic_edit_black_24dp:I

    .line 7
    invoke-static {p0, v2}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 8
    invoke-virtual {v0, v1, p0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    return-object v0
.end method

.method public static synthetic d(Lc/a/a/a/x/g;)Lcom/google/android/material/datepicker/DateSelector;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/x/g;->A0:Lcom/google/android/material/datepicker/DateSelector;

    return-object p0
.end method

.method public static e(Landroid/content/Context;)I
    .registers 6

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    .line 12
    sget v0, Lc/a/a/a/d;->mtrl_calendar_navigation_height:I

    .line 13
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sget v1, Lc/a/a/a/d;->mtrl_calendar_navigation_top_padding:I

    .line 14
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    add-int/2addr v0, v1

    sget v1, Lc/a/a/a/d;->mtrl_calendar_navigation_bottom_padding:I

    .line 15
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 16
    sget v1, Lc/a/a/a/d;->mtrl_calendar_days_of_week_height:I

    .line 17
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 18
    sget v2, Lc/a/a/a/x/j;->m:I

    sget v3, Lc/a/a/a/d;->mtrl_calendar_day_height:I

    .line 19
    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    mul-int v2, v2, v3

    sget v3, Lc/a/a/a/x/j;->m:I

    add-int/lit8 v3, v3, -0x1

    sget v4, Lc/a/a/a/d;->mtrl_calendar_month_vertical_padding:I

    .line 20
    invoke-virtual {p0, v4}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v4

    mul-int v3, v3, v4

    add-int/2addr v2, v3

    .line 21
    sget v3, Lc/a/a/a/d;->mtrl_calendar_bottom_padding:I

    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p0

    add-int/2addr v0, v1

    add-int/2addr v0, v2

    add-int/2addr v0, p0

    return v0
.end method

.method public static synthetic e(Lc/a/a/a/x/g;)Landroid/widget/Button;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/x/g;->L0:Landroid/widget/Button;

    return-object p0
.end method

.method public static f(Landroid/content/Context;)I
    .registers 5

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    .line 3
    sget v0, Lc/a/a/a/d;->mtrl_calendar_content_padding:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    .line 4
    invoke-static {}, Lcom/google/android/material/datepicker/Month;->g()Lcom/google/android/material/datepicker/Month;

    move-result-object v1

    iget v1, v1, Lcom/google/android/material/datepicker/Month;->k:I

    .line 5
    sget v2, Lc/a/a/a/d;->mtrl_calendar_day_width:I

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 6
    sget v3, Lc/a/a/a/d;->mtrl_calendar_month_horizontal_padding:I

    .line 7
    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p0

    mul-int/lit8 v0, v0, 0x2

    mul-int v2, v2, v1

    add-int/2addr v0, v2

    add-int/lit8 v1, v1, -0x1

    mul-int v1, v1, p0

    add-int/2addr v0, v1

    return v0
.end method

.method public static synthetic f(Lc/a/a/a/x/g;)Lcom/google/android/material/internal/CheckableImageButton;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/x/g;->J0:Lcom/google/android/material/internal/CheckableImageButton;

    return-object p0
.end method

.method public static synthetic g(Lc/a/a/a/x/g;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/x/g;->E0()V

    return-void
.end method

.method public static g(Landroid/content/Context;)Z
    .registers 2

    const v0, 0x101020d

    .line 2
    invoke-static {p0, v0}, Lc/a/a/a/x/g;->a(Landroid/content/Context;I)Z

    move-result p0

    return p0
.end method

.method public static h(Landroid/content/Context;)Z
    .registers 2

    .line 1
    sget v0, Lc/a/a/a/b;->nestedScrollable:I

    invoke-static {p0, v0}, Lc/a/a/a/x/g;->a(Landroid/content/Context;I)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public C0()Ljava/lang/String;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/g;->A0:Lcom/google/android/material/datepicker/DateSelector;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/material/datepicker/DateSelector;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final D0()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/g;->A0:Lcom/google/android/material/datepicker/DateSelector;

    invoke-interface {v0}, Lcom/google/android/material/datepicker/DateSelector;->a()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final E0()V
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->t0()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lc/a/a/a/x/g;->b(Landroid/content/Context;)I

    move-result v0

    .line 2
    iget-object v1, p0, Lc/a/a/a/x/g;->A0:Lcom/google/android/material/datepicker/DateSelector;

    iget-object v2, p0, Lc/a/a/a/x/g;->C0:Lcom/google/android/material/datepicker/CalendarConstraints;

    invoke-static {v1, v0, v2}, Lc/a/a/a/x/f;->a(Lcom/google/android/material/datepicker/DateSelector;ILcom/google/android/material/datepicker/CalendarConstraints;)Lc/a/a/a/x/f;

    move-result-object v1

    iput-object v1, p0, Lc/a/a/a/x/g;->D0:Lc/a/a/a/x/f;

    .line 3
    iget-object v1, p0, Lc/a/a/a/x/g;->J0:Lcom/google/android/material/internal/CheckableImageButton;

    .line 4
    invoke-virtual {v1}, Lcom/google/android/material/internal/CheckableImageButton;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_23

    iget-object v1, p0, Lc/a/a/a/x/g;->A0:Lcom/google/android/material/datepicker/DateSelector;

    iget-object v2, p0, Lc/a/a/a/x/g;->C0:Lcom/google/android/material/datepicker/CalendarConstraints;

    .line 5
    invoke-static {v1, v0, v2}, Lc/a/a/a/x/i;->a(Lcom/google/android/material/datepicker/DateSelector;ILcom/google/android/material/datepicker/CalendarConstraints;)Lc/a/a/a/x/i;

    move-result-object v0

    goto :goto_25

    :cond_23
    iget-object v0, p0, Lc/a/a/a/x/g;->D0:Lc/a/a/a/x/f;

    :goto_25
    iput-object v0, p0, Lc/a/a/a/x/g;->B0:Lc/a/a/a/x/m;

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/x/g;->F0()V

    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->o()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->b()Lb/l/d/q;

    move-result-object v0

    .line 8
    sget v1, Lc/a/a/a/f;->mtrl_calendar_frame:I

    iget-object v2, p0, Lc/a/a/a/x/g;->B0:Lc/a/a/a/x/m;

    invoke-virtual {v0, v1, v2}, Lb/l/d/q;->a(ILandroidx/fragment/app/Fragment;)Lb/l/d/q;

    .line 9
    invoke-virtual {v0}, Lb/l/d/q;->c()V

    .line 10
    iget-object v0, p0, Lc/a/a/a/x/g;->B0:Lc/a/a/a/x/m;

    new-instance v1, Lc/a/a/a/x/g$c;

    invoke-direct {v1, p0}, Lc/a/a/a/x/g$c;-><init>(Lc/a/a/a/x/g;)V

    invoke-virtual {v0, v1}, Lc/a/a/a/x/m;->a(Lc/a/a/a/x/l;)Z

    return-void
.end method

.method public final F0()V
    .registers 6

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/x/g;->C0()Ljava/lang/String;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lc/a/a/a/x/g;->I0:Landroid/widget/TextView;

    sget v2, Lc/a/a/a/j;->mtrl_picker_announce_current_selection:I

    .line 3
    invoke-virtual {p0, v2}, Landroidx/fragment/app/Fragment;->a(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 4
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 5
    iget-object v1, p0, Lc/a/a/a/x/g;->I0:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 8

    .line 3
    iget-boolean p3, p0, Lc/a/a/a/x/g;->G0:Z

    if-eqz p3, :cond_7

    sget p3, Lc/a/a/a/h;->mtrl_picker_fullscreen:I

    goto :goto_9

    :cond_7
    sget p3, Lc/a/a/a/h;->mtrl_picker_dialog:I

    .line 4
    :goto_9
    invoke-virtual {p1, p3, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    .line 6
    iget-boolean p3, p0, Lc/a/a/a/x/g;->G0:Z

    if-eqz p3, :cond_29

    .line 7
    sget p3, Lc/a/a/a/f;->mtrl_calendar_frame:I

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    .line 8
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 9
    invoke-static {p2}, Lc/a/a/a/x/g;->f(Landroid/content/Context;)I

    move-result v1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 10
    invoke-virtual {p3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_4d

    .line 11
    :cond_29
    sget p3, Lc/a/a/a/f;->mtrl_calendar_main_pane:I

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    .line 12
    sget v0, Lc/a/a/a/f;->mtrl_calendar_frame:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 13
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 14
    invoke-static {p2}, Lc/a/a/a/x/g;->f(Landroid/content/Context;)I

    move-result v2

    const/4 v3, -0x1

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 15
    invoke-virtual {p3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->t0()Landroid/content/Context;

    move-result-object p3

    invoke-static {p3}, Lc/a/a/a/x/g;->e(Landroid/content/Context;)I

    move-result p3

    invoke-virtual {v0, p3}, Landroid/view/View;->setMinimumHeight(I)V

    .line 17
    :goto_4d
    sget p3, Lc/a/a/a/f;->mtrl_picker_header_selection_text:I

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    iput-object p3, p0, Lc/a/a/a/x/g;->I0:Landroid/widget/TextView;

    const/4 v0, 0x1

    .line 18
    invoke-static {p3, v0}, Lb/h/m/y;->g(Landroid/view/View;I)V

    .line 19
    sget p3, Lc/a/a/a/f;->mtrl_picker_header_toggle:I

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/google/android/material/internal/CheckableImageButton;

    iput-object p3, p0, Lc/a/a/a/x/g;->J0:Lcom/google/android/material/internal/CheckableImageButton;

    .line 20
    sget p3, Lc/a/a/a/f;->mtrl_picker_title_text:I

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    .line 21
    iget-object v1, p0, Lc/a/a/a/x/g;->F0:Ljava/lang/CharSequence;

    if-eqz v1, :cond_75

    .line 22
    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_7a

    .line 23
    :cond_75
    iget v1, p0, Lc/a/a/a/x/g;->E0:I

    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setText(I)V

    .line 24
    :goto_7a
    invoke-virtual {p0, p2}, Lc/a/a/a/x/g;->c(Landroid/content/Context;)V

    .line 25
    sget p2, Lc/a/a/a/f;->confirm_button:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lc/a/a/a/x/g;->L0:Landroid/widget/Button;

    .line 26
    iget-object p2, p0, Lc/a/a/a/x/g;->A0:Lcom/google/android/material/datepicker/DateSelector;

    invoke-interface {p2}, Lcom/google/android/material/datepicker/DateSelector;->c()Z

    move-result p2

    if-eqz p2, :cond_95

    .line 27
    iget-object p2, p0, Lc/a/a/a/x/g;->L0:Landroid/widget/Button;

    invoke-virtual {p2, v0}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_9b

    .line 28
    :cond_95
    iget-object p2, p0, Lc/a/a/a/x/g;->L0:Landroid/widget/Button;

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 29
    :goto_9b
    iget-object p2, p0, Lc/a/a/a/x/g;->L0:Landroid/widget/Button;

    sget-object p3, Lc/a/a/a/x/g;->M0:Ljava/lang/Object;

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 30
    iget-object p2, p0, Lc/a/a/a/x/g;->L0:Landroid/widget/Button;

    new-instance p3, Lc/a/a/a/x/g$a;

    invoke-direct {p3, p0}, Lc/a/a/a/x/g$a;-><init>(Lc/a/a/a/x/g;)V

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    sget p2, Lc/a/a/a/f;->cancel_button:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    .line 32
    sget-object p3, Lc/a/a/a/x/g;->N0:Ljava/lang/Object;

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 33
    new-instance p3, Lc/a/a/a/x/g$b;

    invoke-direct {p3, p0}, Lc/a/a/a/x/g$b;-><init>(Lc/a/a/a/x/g;)V

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1
.end method

.method public final a(Lcom/google/android/material/internal/CheckableImageButton;)V
    .registers 3

    .line 34
    iget-object v0, p0, Lc/a/a/a/x/g;->J0:Lcom/google/android/material/internal/CheckableImageButton;

    .line 35
    invoke-virtual {v0}, Lcom/google/android/material/internal/CheckableImageButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 36
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getContext()Landroid/content/Context;

    move-result-object p1

    sget v0, Lc/a/a/a/j;->mtrl_picker_toggle_to_calendar_input_mode:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1d

    .line 37
    :cond_13
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getContext()Landroid/content/Context;

    move-result-object p1

    sget v0, Lc/a/a/a/j;->mtrl_picker_toggle_to_text_input_mode:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 38
    :goto_1d
    iget-object v0, p0, Lc/a/a/a/x/g;->J0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final b(Landroid/content/Context;)I
    .registers 3

    .line 2
    iget v0, p0, Lc/a/a/a/x/g;->z0:I

    if-eqz v0, :cond_5

    return v0

    .line 3
    :cond_5
    iget-object v0, p0, Lc/a/a/a/x/g;->A0:Lcom/google/android/material/datepicker/DateSelector;

    invoke-interface {v0, p1}, Lcom/google/android/material/datepicker/DateSelector;->b(Landroid/content/Context;)I

    move-result p1

    return p1
.end method

.method public final c(Landroid/content/Context;)V
    .registers 4

    .line 10
    iget-object v0, p0, Lc/a/a/a/x/g;->J0:Lcom/google/android/material/internal/CheckableImageButton;

    sget-object v1, Lc/a/a/a/x/g;->O0:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V

    .line 11
    iget-object v0, p0, Lc/a/a/a/x/g;->J0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {p1}, Lc/a/a/a/x/g;->d(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 12
    iget-object p1, p0, Lc/a/a/a/x/g;->J0:Lcom/google/android/material/internal/CheckableImageButton;

    iget v0, p0, Lc/a/a/a/x/g;->H0:I

    if-eqz v0, :cond_18

    const/4 v0, 0x1

    goto :goto_19

    :cond_18
    const/4 v0, 0x0

    :goto_19
    invoke-virtual {p1, v0}, Lcom/google/android/material/internal/CheckableImageButton;->setChecked(Z)V

    .line 13
    iget-object p1, p0, Lc/a/a/a/x/g;->J0:Lcom/google/android/material/internal/CheckableImageButton;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/a;)V

    .line 14
    iget-object p1, p0, Lc/a/a/a/x/g;->J0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {p0, p1}, Lc/a/a/a/x/g;->a(Lcom/google/android/material/internal/CheckableImageButton;)V

    .line 15
    iget-object p1, p0, Lc/a/a/a/x/g;->J0:Lcom/google/android/material/internal/CheckableImageButton;

    new-instance v0, Lc/a/a/a/x/g$d;

    invoke-direct {v0, p0}, Lc/a/a/a/x/g$d;-><init>(Lc/a/a/a/x/g;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final c(Landroid/os/Bundle;)V
    .registers 3

    .line 2
    invoke-super {p0, p1}, Lb/l/d/c;->c(Landroid/os/Bundle;)V

    if-nez p1, :cond_9

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->n()Landroid/os/Bundle;

    move-result-object p1

    :cond_9
    const-string v0, "OVERRIDE_THEME_RES_ID"

    .line 4
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lc/a/a/a/x/g;->z0:I

    const-string v0, "DATE_SELECTOR_KEY"

    .line 5
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/datepicker/DateSelector;

    iput-object v0, p0, Lc/a/a/a/x/g;->A0:Lcom/google/android/material/datepicker/DateSelector;

    const-string v0, "CALENDAR_CONSTRAINTS_KEY"

    .line 6
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/datepicker/CalendarConstraints;

    iput-object v0, p0, Lc/a/a/a/x/g;->C0:Lcom/google/android/material/datepicker/CalendarConstraints;

    const-string v0, "TITLE_TEXT_RES_ID_KEY"

    .line 7
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lc/a/a/a/x/g;->E0:I

    const-string v0, "TITLE_TEXT_KEY"

    .line 8
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/x/g;->F0:Ljava/lang/CharSequence;

    const-string v0, "INPUT_MODE_KEY"

    .line 9
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lc/a/a/a/x/g;->H0:I

    return-void
.end method

.method public final e(Landroid/os/Bundle;)V
    .registers 5

    .line 2
    invoke-super {p0, p1}, Lb/l/d/c;->e(Landroid/os/Bundle;)V

    .line 3
    iget v0, p0, Lc/a/a/a/x/g;->z0:I

    const-string v1, "OVERRIDE_THEME_RES_ID"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 4
    iget-object v0, p0, Lc/a/a/a/x/g;->A0:Lcom/google/android/material/datepicker/DateSelector;

    const-string v1, "DATE_SELECTOR_KEY"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 5
    new-instance v0, Lcom/google/android/material/datepicker/CalendarConstraints$b;

    iget-object v1, p0, Lc/a/a/a/x/g;->C0:Lcom/google/android/material/datepicker/CalendarConstraints;

    invoke-direct {v0, v1}, Lcom/google/android/material/datepicker/CalendarConstraints$b;-><init>(Lcom/google/android/material/datepicker/CalendarConstraints;)V

    .line 6
    iget-object v1, p0, Lc/a/a/a/x/g;->D0:Lc/a/a/a/x/f;

    invoke-virtual {v1}, Lc/a/a/a/x/f;->B0()Lcom/google/android/material/datepicker/Month;

    move-result-object v1

    if-eqz v1, :cond_2b

    .line 7
    iget-object v1, p0, Lc/a/a/a/x/g;->D0:Lc/a/a/a/x/f;

    invoke-virtual {v1}, Lc/a/a/a/x/f;->B0()Lcom/google/android/material/datepicker/Month;

    move-result-object v1

    iget-wide v1, v1, Lcom/google/android/material/datepicker/Month;->m:J

    invoke-virtual {v0, v1, v2}, Lcom/google/android/material/datepicker/CalendarConstraints$b;->a(J)Lcom/google/android/material/datepicker/CalendarConstraints$b;

    .line 8
    :cond_2b
    invoke-virtual {v0}, Lcom/google/android/material/datepicker/CalendarConstraints$b;->a()Lcom/google/android/material/datepicker/CalendarConstraints;

    move-result-object v0

    const-string v1, "CALENDAR_CONSTRAINTS_KEY"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 9
    iget v0, p0, Lc/a/a/a/x/g;->E0:I

    const-string v1, "TITLE_TEXT_RES_ID_KEY"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 10
    iget-object v0, p0, Lc/a/a/a/x/g;->F0:Ljava/lang/CharSequence;

    const-string v1, "TITLE_TEXT_KEY"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public f0()V
    .registers 10

    .line 1
    invoke-super {p0}, Lb/l/d/c;->f0()V

    .line 2
    invoke-virtual {p0}, Lb/l/d/c;->B0()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 3
    iget-boolean v1, p0, Lc/a/a/a/x/g;->G0:Z

    if-eqz v1, :cond_19

    const/4 v1, -0x1

    .line 4
    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setLayout(II)V

    .line 5
    iget-object v1, p0, Lc/a/a/a/x/g;->K0:Lc/a/a/a/l0/h;

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_4a

    :cond_19
    const/4 v1, -0x2

    .line 6
    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setLayout(II)V

    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->d()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lc/a/a/a/d;->mtrl_calendar_dialog_background_inset:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v8

    .line 8
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1, v8, v8, v8, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 9
    new-instance v2, Landroid/graphics/drawable/InsetDrawable;

    iget-object v4, p0, Lc/a/a/a/x/g;->K0:Lc/a/a/a/l0/h;

    move-object v3, v2

    move v5, v8

    move v6, v8

    move v7, v8

    invoke-direct/range {v3 .. v8}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    invoke-virtual {v0, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 10
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v2, Lc/a/a/a/y/a;

    .line 11
    invoke-virtual {p0}, Lb/l/d/c;->B0()Landroid/app/Dialog;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lc/a/a/a/y/a;-><init>(Landroid/app/Dialog;Landroid/graphics/Rect;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 12
    :goto_4a
    invoke-virtual {p0}, Lc/a/a/a/x/g;->E0()V

    return-void
.end method

.method public g0()V
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/g;->B0:Lc/a/a/a/x/m;

    invoke-virtual {v0}, Lc/a/a/a/x/m;->x0()V

    .line 2
    invoke-super {p0}, Lb/l/d/c;->g0()V

    return-void
.end method

.method public final n(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 8

    .line 1
    new-instance p1, Landroid/app/Dialog;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->t0()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->t0()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lc/a/a/a/x/g;->b(Landroid/content/Context;)I

    move-result v1

    invoke-direct {p1, v0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 2
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 3
    invoke-static {v0}, Lc/a/a/a/x/g;->g(Landroid/content/Context;)Z

    move-result v1

    iput-boolean v1, p0, Lc/a/a/a/x/g;->G0:Z

    .line 4
    sget v1, Lc/a/a/a/b;->colorSurface:I

    const-class v2, Lc/a/a/a/x/g;

    .line 5
    invoke-virtual {v2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    .line 6
    invoke-static {v0, v1, v2}, Lc/a/a/a/i0/b;->a(Landroid/content/Context;ILjava/lang/String;)I

    move-result v1

    .line 7
    new-instance v2, Lc/a/a/a/l0/h;

    sget v3, Lc/a/a/a/b;->materialCalendarStyle:I

    sget v4, Lc/a/a/a/k;->Widget_MaterialComponents_MaterialCalendar:I

    const/4 v5, 0x0

    invoke-direct {v2, v0, v5, v3, v4}, Lc/a/a/a/l0/h;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput-object v2, p0, Lc/a/a/a/x/g;->K0:Lc/a/a/a/l0/h;

    .line 8
    invoke-virtual {v2, v0}, Lc/a/a/a/l0/h;->a(Landroid/content/Context;)V

    .line 9
    iget-object v0, p0, Lc/a/a/a/x/g;->K0:Lc/a/a/a/l0/h;

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    .line 10
    iget-object v0, p0, Lc/a/a/a/x/g;->K0:Lc/a/a/a/l0/h;

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lb/h/m/y;->m(Landroid/view/View;)F

    move-result v1

    invoke-virtual {v0, v1}, Lc/a/a/a/l0/h;->b(F)V

    return-object p1
.end method

.method public final onCancel(Landroid/content/DialogInterface;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/g;->x0:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/DialogInterface$OnCancelListener;

    .line 2
    invoke-interface {v1, p1}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    goto :goto_6

    .line 3
    :cond_16
    invoke-super {p0, p1}, Lb/l/d/c;->onCancel(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public final onDismiss(Landroid/content/DialogInterface;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/g;->y0:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/DialogInterface$OnDismissListener;

    .line 2
    invoke-interface {v1, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    goto :goto_6

    .line 3
    :cond_16
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->M()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_21

    .line 4
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 5
    :cond_21
    invoke-super {p0, p1}, Lb/l/d/c;->onDismiss(Landroid/content/DialogInterface;)V

    return-void
.end method
