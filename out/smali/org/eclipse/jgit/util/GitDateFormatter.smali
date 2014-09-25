.class public Lorg/eclipse/jgit/util/GitDateFormatter;
.super Ljava/lang/Object;
.source "GitDateFormatter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/util/GitDateFormatter$1;,
        Lorg/eclipse/jgit/util/GitDateFormatter$Format;
    }
.end annotation


# instance fields
.field private dateTimeInstance:Ljava/text/DateFormat;

.field private dateTimeInstance2:Ljava/text/DateFormat;

.field private final format:Lorg/eclipse/jgit/util/GitDateFormatter$Format;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/util/GitDateFormatter$Format;)V
    .locals 4
    .parameter "format"

    .prologue
    const/4 v3, 0x2

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    iput-object p1, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->format:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    .line 125
    sget-object v1, Lorg/eclipse/jgit/util/GitDateFormatter$1;->$SwitchMap$org$eclipse$jgit$util$GitDateFormatter$Format:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 155
    :goto_0
    return-void

    .line 129
    :pswitch_0
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "EEE MMM dd HH:mm:ss yyyy Z"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v1, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->dateTimeInstance:Ljava/text/DateFormat;

    goto :goto_0

    .line 133
    :pswitch_1
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd HH:mm:ss Z"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v1, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->dateTimeInstance:Ljava/text/DateFormat;

    goto :goto_0

    .line 137
    :pswitch_2
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "EEE MMM dd HH:mm:ss yyyy"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v1, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->dateTimeInstance:Ljava/text/DateFormat;

    goto :goto_0

    .line 141
    :pswitch_3
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "EEE, dd MMM yyyy HH:mm:ss Z"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v1, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->dateTimeInstance:Ljava/text/DateFormat;

    goto :goto_0

    .line 145
    :pswitch_4
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v1, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->dateTimeInstance:Ljava/text/DateFormat;

    goto :goto_0

    .line 149
    :pswitch_5
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v0

    .line 150
    .local v0, systemReader:Lorg/eclipse/jgit/util/SystemReader;
    invoke-virtual {v0, v3, v3}, Lorg/eclipse/jgit/util/SystemReader;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->dateTimeInstance:Ljava/text/DateFormat;

    .line 152
    const-string v1, "Z"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/SystemReader;->getSimpleDateFormat(Ljava/lang/String;)Ljava/text/SimpleDateFormat;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->dateTimeInstance2:Ljava/text/DateFormat;

    goto :goto_0

    .line 125
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method


# virtual methods
.method public formatDate(Lorg/eclipse/jgit/lib/PersonIdent;)Ljava/lang/String;
    .locals 13
    .parameter "ident"

    .prologue
    .line 166
    sget-object v6, Lorg/eclipse/jgit/util/GitDateFormatter$1;->$SwitchMap$org$eclipse$jgit$util$GitDateFormatter$Format:[I

    iget-object v7, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->format:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    invoke-virtual {v7}, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 195
    :pswitch_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v5

    .line 196
    .local v5, tz:Ljava/util/TimeZone;
    if-nez v5, :cond_0

    .line 197
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/util/SystemReader;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v5

    .line 198
    :cond_0
    iget-object v6, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->dateTimeInstance:Ljava/text/DateFormat;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 199
    iget-object v6, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->dateTimeInstance:Ljava/text/DateFormat;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getWhen()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    .end local v5           #tz:Ljava/util/TimeZone;
    :goto_0
    return-object v6

    .line 168
    :pswitch_1
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getTimeZoneOffset()I

    move-result v2

    .line 169
    .local v2, offset:I
    if-gez v2, :cond_1

    const-string v4, "-"

    .line 171
    .local v4, sign:Ljava/lang/String;
    :goto_1
    if-gez v2, :cond_2

    .line 172
    neg-int v3, v2

    .line 175
    .local v3, offset2:I
    :goto_2
    div-int/lit8 v0, v3, 0x3c

    .line 176
    .local v0, hours:I
    rem-int/lit8 v1, v3, 0x3c

    .line 177
    .local v1, minutes:I
    const-string v6, "%d %s%02d%02d"

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getWhen()Ljava/util/Date;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    const-wide/16 v11, 0x3e8

    div-long/2addr v9, v11

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    aput-object v4, v7, v8

    const/4 v8, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 169
    .end local v0           #hours:I
    .end local v1           #minutes:I
    .end local v3           #offset2:I
    .end local v4           #sign:Ljava/lang/String;
    :cond_1
    const-string v4, "+"

    goto :goto_1

    .line 174
    .restart local v4       #sign:Ljava/lang/String;
    :cond_2
    move v3, v2

    .restart local v3       #offset2:I
    goto :goto_2

    .line 180
    .end local v2           #offset:I
    .end local v3           #offset2:I
    .end local v4           #sign:Ljava/lang/String;
    :pswitch_2
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getWhen()Ljava/util/Date;

    move-result-object v6

    invoke-static {v6}, Lorg/eclipse/jgit/util/RelativeDateFormatter;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 183
    :pswitch_3
    iget-object v6, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->dateTimeInstance:Ljava/text/DateFormat;

    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v7

    invoke-virtual {v7}, Lorg/eclipse/jgit/util/SystemReader;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 185
    iget-object v6, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->dateTimeInstance:Ljava/text/DateFormat;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getWhen()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 187
    :pswitch_4
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v5

    .line 188
    .restart local v5       #tz:Ljava/util/TimeZone;
    if-nez v5, :cond_3

    .line 189
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/util/SystemReader;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v5

    .line 190
    :cond_3
    iget-object v6, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->dateTimeInstance:Ljava/text/DateFormat;

    invoke-virtual {v6, v5}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 191
    iget-object v6, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->dateTimeInstance2:Ljava/text/DateFormat;

    invoke-virtual {v6, v5}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 192
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->dateTimeInstance:Ljava/text/DateFormat;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getWhen()Ljava/util/Date;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lorg/eclipse/jgit/util/GitDateFormatter;->dateTimeInstance2:Ljava/text/DateFormat;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getWhen()Ljava/util/Date;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_0

    .line 166
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
