.class public Lcom/google/android/material/datepicker/RangeDateSelector;
.super Ljava/lang/Object;
.source "RangeDateSelector.java"

# interfaces
.implements Lcom/google/android/material/datepicker/DateSelector;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/material/datepicker/DateSelector<",
        "Lb/h/l/d<",
        "Ljava/lang/Long;",
        "Ljava/lang/Long;",
        ">;>;"
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/material/datepicker/RangeDateSelector;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public h:Ljava/lang/String;

.field public i:Ljava/lang/Long;

.field public j:Ljava/lang/Long;

.field public k:Ljava/lang/Long;

.field public l:Ljava/lang/Long;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Lcom/google/android/material/datepicker/RangeDateSelector$c;

    invoke-direct {v0}, Lcom/google/android/material/datepicker/RangeDateSelector$c;-><init>()V

    sput-object v0, Lcom/google/android/material/datepicker/RangeDateSelector;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    .line 3
    iput-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    .line 4
    iput-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->k:Ljava/lang/Long;

    .line 5
    iput-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->l:Ljava/lang/Long;

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/datepicker/RangeDateSelector;Ljava/lang/Long;)Ljava/lang/Long;
    .registers 2

    .line 2
    iput-object p1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->k:Ljava/lang/Long;

    return-object p1
.end method

.method public static synthetic a(Lcom/google/android/material/datepicker/RangeDateSelector;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputLayout;Lc/a/a/a/x/l;)V
    .registers 4

    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/material/datepicker/RangeDateSelector;->a(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputLayout;Lc/a/a/a/x/l;)V

    return-void
.end method

.method public static synthetic b(Lcom/google/android/material/datepicker/RangeDateSelector;Ljava/lang/Long;)Ljava/lang/Long;
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->l:Ljava/lang/Long;

    return-object p1
.end method

.method public static synthetic c(Lcom/google/android/material/datepicker/RangeDateSelector;Ljava/lang/Long;)Ljava/lang/Long;
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    return-object p1
.end method

.method public static synthetic d(Lcom/google/android/material/datepicker/RangeDateSelector;Ljava/lang/Long;)Ljava/lang/Long;
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    return-object p1
.end method


# virtual methods
.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;Lcom/google/android/material/datepicker/CalendarConstraints;Lc/a/a/a/x/l;)Landroid/view/View;
    .registers 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/LayoutInflater;",
            "Landroid/view/ViewGroup;",
            "Landroid/os/Bundle;",
            "Lcom/google/android/material/datepicker/CalendarConstraints;",
            "Lc/a/a/a/x/l<",
            "Lb/h/l/d<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;>;)",
            "Landroid/view/View;"
        }
    .end annotation

    move-object/from16 v9, p0

    .line 18
    sget v0, Lc/a/a/a/h;->mtrl_picker_text_input_date_range:I

    const/4 v1, 0x0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    .line 19
    invoke-virtual {v2, v0, v3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v10

    .line 20
    sget v0, Lc/a/a/a/f;->mtrl_picker_text_input_range_start:I

    .line 21
    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Lcom/google/android/material/textfield/TextInputLayout;

    .line 22
    sget v0, Lc/a/a/a/f;->mtrl_picker_text_input_range_end:I

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Lcom/google/android/material/textfield/TextInputLayout;

    .line 23
    invoke-virtual {v11}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v13

    .line 24
    invoke-virtual {v12}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v14

    .line 25
    invoke-static {}, Lc/a/a/a/d0/d;->a()Z

    move-result v0

    if-eqz v0, :cond_35

    const/16 v0, 0x11

    .line 26
    invoke-virtual {v13, v0}, Landroid/widget/EditText;->setInputType(I)V

    .line 27
    invoke-virtual {v14, v0}, Landroid/widget/EditText;->setInputType(I)V

    .line 28
    :cond_35
    invoke-virtual {v10}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lc/a/a/a/j;->mtrl_picker_invalid_range:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/google/android/material/datepicker/RangeDateSelector;->h:Ljava/lang/String;

    .line 29
    invoke-static {}, Lc/a/a/a/x/p;->a()Ljava/text/SimpleDateFormat;

    move-result-object v15

    .line 30
    iget-object v0, v9, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    if-eqz v0, :cond_54

    .line 31
    invoke-virtual {v15, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 32
    iget-object v0, v9, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    iput-object v0, v9, Lcom/google/android/material/datepicker/RangeDateSelector;->k:Ljava/lang/Long;

    .line 33
    :cond_54
    iget-object v0, v9, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    if-eqz v0, :cond_63

    .line 34
    invoke-virtual {v15, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 35
    iget-object v0, v9, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    iput-object v0, v9, Lcom/google/android/material/datepicker/RangeDateSelector;->l:Ljava/lang/Long;

    .line 36
    :cond_63
    invoke-virtual {v10}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0, v15}, Lc/a/a/a/x/p;->a(Landroid/content/res/Resources;Ljava/text/SimpleDateFormat;)Ljava/lang/String;

    move-result-object v8

    .line 37
    invoke-virtual {v11, v8}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderText(Ljava/lang/CharSequence;)V

    .line 38
    invoke-virtual {v12, v8}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderText(Ljava/lang/CharSequence;)V

    .line 39
    new-instance v7, Lcom/google/android/material/datepicker/RangeDateSelector$a;

    move-object v0, v7

    move-object/from16 v1, p0

    move-object v2, v8

    move-object v3, v15

    move-object v4, v11

    move-object/from16 v5, p4

    move-object v6, v11

    move-object v9, v7

    move-object v7, v12

    move-object/from16 v16, v8

    move-object/from16 v8, p5

    invoke-direct/range {v0 .. v8}, Lcom/google/android/material/datepicker/RangeDateSelector$a;-><init>(Lcom/google/android/material/datepicker/RangeDateSelector;Ljava/lang/String;Ljava/text/DateFormat;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/datepicker/CalendarConstraints;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputLayout;Lc/a/a/a/x/l;)V

    invoke-virtual {v13, v9}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 40
    new-instance v9, Lcom/google/android/material/datepicker/RangeDateSelector$b;

    move-object v0, v9

    move-object/from16 v2, v16

    move-object v4, v12

    invoke-direct/range {v0 .. v8}, Lcom/google/android/material/datepicker/RangeDateSelector$b;-><init>(Lcom/google/android/material/datepicker/RangeDateSelector;Ljava/lang/String;Ljava/text/DateFormat;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/datepicker/CalendarConstraints;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputLayout;Lc/a/a/a/x/l;)V

    invoke-virtual {v14, v9}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 41
    invoke-static {v13}, Lc/a/a/a/d0/t;->g(Landroid/view/View;)V

    return-object v10
.end method

.method public a()Lb/h/l/d;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lb/h/l/d<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 4
    new-instance v0, Lb/h/l/d;

    iget-object v1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    iget-object v2, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    invoke-direct {v0, v1, v2}, Lb/h/l/d;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method public bridge synthetic a()Ljava/lang/Object;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/RangeDateSelector;->a()Lb/h/l/d;

    move-result-object v0

    return-object v0
.end method

.method public a(Landroid/content/Context;)Ljava/lang/String;
    .registers 8

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    .line 6
    iget-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    if-nez v0, :cond_13

    iget-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    if-nez v0, :cond_13

    .line 7
    sget v0, Lc/a/a/a/j;->mtrl_picker_range_header_unselected:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 8
    :cond_13
    iget-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2e

    .line 9
    sget v0, Lc/a/a/a/j;->mtrl_picker_range_header_only_start_selected:I

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    .line 10
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-static {v3, v4}, Lc/a/a/a/x/d;->a(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    .line 11
    invoke-virtual {p1, v0, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 12
    :cond_2e
    iget-object v3, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    if-nez v3, :cond_45

    .line 13
    sget v3, Lc/a/a/a/j;->mtrl_picker_range_header_only_end_selected:I

    new-array v2, v2, [Ljava/lang/Object;

    .line 14
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-static {v4, v5}, Lc/a/a/a/x/d;->a(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v1

    .line 15
    invoke-virtual {p1, v3, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 16
    :cond_45
    invoke-static {v3, v0}, Lc/a/a/a/x/d;->a(Ljava/lang/Long;Ljava/lang/Long;)Lb/h/l/d;

    move-result-object v0

    .line 17
    sget v3, Lc/a/a/a/j;->mtrl_picker_range_header_selected:I

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, v0, Lb/h/l/d;->a:Ljava/lang/Object;

    aput-object v5, v4, v1

    iget-object v0, v0, Lb/h/l/d;->b:Ljava/lang/Object;

    aput-object v0, v4, v2

    invoke-virtual {p1, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final a(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputLayout;)V
    .registers 6

    .line 51
    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->getError()Ljava/lang/CharSequence;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->h:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->getError()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 52
    invoke-virtual {p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setError(Ljava/lang/CharSequence;)V

    .line 53
    :cond_16
    invoke-virtual {p2}, Lcom/google/android/material/textfield/TextInputLayout;->getError()Ljava/lang/CharSequence;

    move-result-object p1

    if-eqz p1, :cond_2b

    invoke-virtual {p2}, Lcom/google/android/material/textfield/TextInputLayout;->getError()Ljava/lang/CharSequence;

    move-result-object p1

    const-string v0, " "

    invoke-virtual {v0, p1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2b

    .line 54
    invoke-virtual {p2, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setError(Ljava/lang/CharSequence;)V

    :cond_2b
    return-void
.end method

.method public final a(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputLayout;Lc/a/a/a/x/l;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/material/textfield/TextInputLayout;",
            "Lcom/google/android/material/textfield/TextInputLayout;",
            "Lc/a/a/a/x/l<",
            "Lb/h/l/d<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;>;)V"
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->k:Ljava/lang/Long;

    if-eqz v0, :cond_30

    iget-object v1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->l:Ljava/lang/Long;

    if-nez v1, :cond_9

    goto :goto_30

    .line 43
    :cond_9
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->l:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/google/android/material/datepicker/RangeDateSelector;->a(JJ)Z

    move-result v0

    if-eqz v0, :cond_29

    .line 44
    iget-object p1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->k:Ljava/lang/Long;

    iput-object p1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    .line 45
    iget-object p1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->l:Ljava/lang/Long;

    iput-object p1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    .line 46
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/RangeDateSelector;->a()Lb/h/l/d;

    move-result-object p1

    invoke-virtual {p3, p1}, Lc/a/a/a/x/l;->a(Ljava/lang/Object;)V

    goto :goto_2f

    .line 47
    :cond_29
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/datepicker/RangeDateSelector;->b(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputLayout;)V

    .line 48
    invoke-virtual {p3}, Lc/a/a/a/x/l;->a()V

    :goto_2f
    return-void

    .line 49
    :cond_30
    :goto_30
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/datepicker/RangeDateSelector;->a(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputLayout;)V

    .line 50
    invoke-virtual {p3}, Lc/a/a/a/x/l;->a()V

    return-void
.end method

.method public final a(JJ)Z
    .registers 6

    cmp-long v0, p1, p3

    if-gtz v0, :cond_6

    const/4 p1, 0x1

    goto :goto_7

    :cond_6
    const/4 p1, 0x0

    :goto_7
    return p1
.end method

.method public b(Landroid/content/Context;)I
    .registers 5

    .line 13
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 15
    sget v2, Lc/a/a/a/d;->mtrl_calendar_maximum_default_fullscreen_minor_axis:I

    .line 16
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 17
    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    if-le v1, v0, :cond_1b

    .line 18
    sget v0, Lc/a/a/a/b;->materialCalendarTheme:I

    goto :goto_1d

    :cond_1b
    sget v0, Lc/a/a/a/b;->materialCalendarFullscreenTheme:I

    .line 19
    :goto_1d
    const-class v1, Lc/a/a/a/x/g;

    .line 20
    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    .line 21
    invoke-static {p1, v0, v1}, Lc/a/a/a/i0/b;->a(Landroid/content/Context;ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public b()Ljava/util/Collection;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lb/h/l/d<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation

    .line 8
    iget-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    if-nez v0, :cond_9

    goto :goto_1b

    .line 9
    :cond_9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    new-instance v1, Lb/h/l/d;

    iget-object v2, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    iget-object v3, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    invoke-direct {v1, v2, v3}, Lb/h/l/d;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0

    .line 12
    :cond_1b
    :goto_1b
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public b(J)V
    .registers 5

    .line 2
    iget-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    if-nez v0, :cond_b

    .line 3
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    goto :goto_29

    .line 4
    :cond_b
    iget-object v1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    if-nez v1, :cond_20

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/google/android/material/datepicker/RangeDateSelector;->a(JJ)Z

    move-result v0

    if-eqz v0, :cond_20

    .line 5
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    goto :goto_29

    :cond_20
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    .line 7
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    :goto_29
    return-void
.end method

.method public final b(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputLayout;)V
    .registers 4

    .line 22
    iget-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->h:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setError(Ljava/lang/CharSequence;)V

    const-string p1, " "

    .line 23
    invoke-virtual {p2, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setError(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public c()Z
    .registers 5

    .line 2
    iget-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    if-eqz v0, :cond_1a

    iget-object v1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    if-eqz v1, :cond_1a

    .line 3
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/google/android/material/datepicker/RangeDateSelector;->a(JJ)Z

    move-result v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x1

    goto :goto_1b

    :cond_1a
    const/4 v0, 0x0

    :goto_1b
    return v0
.end method

.method public d()Ljava/util/Collection;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3
    iget-object v1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    if-eqz v1, :cond_c

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 5
    :cond_c
    iget-object v1, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    if-eqz v1, :cond_13

    .line 6
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_13
    return-object v0
.end method

.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    .line 1
    iget-object p2, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->i:Ljava/lang/Long;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    .line 2
    iget-object p2, p0, Lcom/google/android/material/datepicker/RangeDateSelector;->j:Ljava/lang/Long;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    return-void
.end method
