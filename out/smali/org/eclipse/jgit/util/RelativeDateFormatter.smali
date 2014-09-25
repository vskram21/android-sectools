.class public Lorg/eclipse/jgit/util/RelativeDateFormatter;
.super Ljava/lang/Object;
.source "RelativeDateFormatter.java"


# static fields
.field static final DAY_IN_MILLIS:J = 0x5265c00L

.field static final HOUR_IN_MILLIS:J = 0x36ee80L

.field static final MINUTE_IN_MILLIS:J = 0xea60L

.field static final MONTH_IN_MILLIS:J = 0x9a7ec800L

.field static final SECOND_IN_MILLIS:J = 0x3e8L

.field static final WEEK_IN_MILLIS:J = 0x240c8400L

.field static final YEAR_IN_MILLIS:J = 0x757b12c00L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static format(Ljava/util/Date;)Ljava/lang/String;
    .locals 13
    .parameter "when"

    .prologue
    .line 78
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v8

    invoke-virtual {v8}, Lorg/eclipse/jgit/util/SystemReader;->getCurrentTime()J

    move-result-wide v8

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    sub-long v0, v8, v10

    .line 82
    .local v0, ageMillis:J
    const-wide/16 v8, 0x0

    cmp-long v8, v0, v8

    if-gez v8, :cond_0

    .line 83
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->inTheFuture:Ljava/lang/String;

    .line 130
    :goto_0
    return-object v8

    .line 86
    :cond_0
    const-wide/32 v8, 0xea60

    invoke-static {v8, v9}, Lorg/eclipse/jgit/util/RelativeDateFormatter;->upperLimit(J)J

    move-result-wide v8

    cmp-long v8, v0, v8

    if-gez v8, :cond_1

    .line 87
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->secondsAgo:Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-wide/16 v11, 0x3e8

    invoke-static {v0, v1, v11, v12}, Lorg/eclipse/jgit/util/RelativeDateFormatter;->round(JJ)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    goto :goto_0

    .line 91
    :cond_1
    const-wide/32 v8, 0x36ee80

    invoke-static {v8, v9}, Lorg/eclipse/jgit/util/RelativeDateFormatter;->upperLimit(J)J

    move-result-wide v8

    cmp-long v8, v0, v8

    if-gez v8, :cond_2

    .line 92
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->minutesAgo:Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-wide/32 v11, 0xea60

    invoke-static {v0, v1, v11, v12}, Lorg/eclipse/jgit/util/RelativeDateFormatter;->round(JJ)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    goto :goto_0

    .line 96
    :cond_2
    const-wide/32 v8, 0x5265c00

    invoke-static {v8, v9}, Lorg/eclipse/jgit/util/RelativeDateFormatter;->upperLimit(J)J

    move-result-wide v8

    cmp-long v8, v0, v8

    if-gez v8, :cond_3

    .line 97
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->hoursAgo:Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-wide/32 v11, 0x36ee80

    invoke-static {v0, v1, v11, v12}, Lorg/eclipse/jgit/util/RelativeDateFormatter;->round(JJ)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    goto :goto_0

    .line 101
    :cond_3
    const-wide/32 v8, 0x48190800

    cmp-long v8, v0, v8

    if-gez v8, :cond_4

    .line 102
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->daysAgo:Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-wide/32 v11, 0x5265c00

    invoke-static {v0, v1, v11, v12}, Lorg/eclipse/jgit/util/RelativeDateFormatter;->round(JJ)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_0

    .line 106
    :cond_4
    const-wide v8, 0x1687d2800L

    cmp-long v8, v0, v8

    if-gez v8, :cond_5

    .line 107
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->weeksAgo:Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-wide/32 v11, 0x240c8400

    invoke-static {v0, v1, v11, v12}, Lorg/eclipse/jgit/util/RelativeDateFormatter;->round(JJ)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_0

    .line 111
    :cond_5
    const-wide v8, 0x757b12c00L

    cmp-long v8, v0, v8

    if-gez v8, :cond_6

    .line 112
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->monthsAgo:Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-wide v11, 0x9a7ec800L

    invoke-static {v0, v1, v11, v12}, Lorg/eclipse/jgit/util/RelativeDateFormatter;->round(JJ)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_0

    .line 116
    :cond_6
    const-wide v8, 0x24b675dc00L

    cmp-long v8, v0, v8

    if-gez v8, :cond_b

    .line 117
    const-wide v8, 0x757b12c00L

    div-long v6, v0, v8

    .line 118
    .local v6, years:J
    const-wide/16 v8, 0x1

    cmp-long v8, v6, v8

    if-lez v8, :cond_7

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v5, v8, Lorg/eclipse/jgit/internal/JGitText;->years:Ljava/lang/String;

    .line 120
    .local v5, yearLabel:Ljava/lang/String;
    :goto_1
    const-wide v8, 0x757b12c00L

    rem-long v8, v0, v8

    const-wide v10, 0x9a7ec800L

    invoke-static {v8, v9, v10, v11}, Lorg/eclipse/jgit/util/RelativeDateFormatter;->round(JJ)J

    move-result-wide v3

    .line 121
    .local v3, months:J
    const-wide/16 v8, 0x1

    cmp-long v8, v3, v8

    if-lez v8, :cond_8

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v2, v8, Lorg/eclipse/jgit/internal/JGitText;->months:Ljava/lang/String;

    .line 123
    .local v2, monthLabel:Ljava/lang/String;
    :goto_2
    const-wide/16 v8, 0x0

    cmp-long v8, v3, v8

    if-nez v8, :cond_a

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->years0MonthsAgo:Ljava/lang/String;

    :goto_3
    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    aput-object v5, v9, v10

    const/4 v10, 0x2

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x3

    aput-object v2, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_0

    .line 118
    .end local v2           #monthLabel:Ljava/lang/String;
    .end local v3           #months:J
    .end local v5           #yearLabel:Ljava/lang/String;
    :cond_7
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v5, v8, Lorg/eclipse/jgit/internal/JGitText;->year:Ljava/lang/String;

    goto :goto_1

    .line 121
    .restart local v3       #months:J
    .restart local v5       #yearLabel:Ljava/lang/String;
    :cond_8
    const-wide/16 v8, 0x1

    cmp-long v8, v3, v8

    if-nez v8, :cond_9

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v2, v8, Lorg/eclipse/jgit/internal/JGitText;->month:Ljava/lang/String;

    goto :goto_2

    :cond_9
    const-string v2, ""

    goto :goto_2

    .line 123
    .restart local v2       #monthLabel:Ljava/lang/String;
    :cond_a
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->yearsMonthsAgo:Ljava/lang/String;

    goto :goto_3

    .line 130
    .end local v2           #monthLabel:Ljava/lang/String;
    .end local v3           #months:J
    .end local v5           #yearLabel:Ljava/lang/String;
    .end local v6           #years:J
    :cond_b
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->yearsAgo:Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-wide v11, 0x757b12c00L

    invoke-static {v0, v1, v11, v12}, Lorg/eclipse/jgit/util/RelativeDateFormatter;->round(JJ)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_0
.end method

.method private static round(JJ)J
    .locals 4
    .parameter "n"
    .parameter "unit"

    .prologue
    .line 140
    const-wide/16 v2, 0x2

    div-long v2, p2, v2

    add-long/2addr v2, p0

    div-long v0, v2, p2

    .line 141
    .local v0, rounded:J
    return-wide v0
.end method

.method private static upperLimit(J)J
    .locals 4
    .parameter "unit"

    .prologue
    .line 135
    const-wide/16 v2, 0x2

    div-long v2, p0, v2

    add-long v0, p0, v2

    .line 136
    .local v0, limit:J
    return-wide v0
.end method
