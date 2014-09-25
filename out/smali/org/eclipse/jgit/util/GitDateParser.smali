.class public Lorg/eclipse/jgit/util/GitDateParser;
.super Ljava/lang/Object;
.source "GitDateParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;
    }
.end annotation


# static fields
.field public static final NEVER:Ljava/util/Date;

.field private static formatCache:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/util/Locale;",
            "Ljava/util/Map",
            "<",
            "Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;",
            "Ljava/text/SimpleDateFormat;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 70
    new-instance v0, Ljava/util/Date;

    const-wide v1, 0x7fffffffffffffffL

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateParser;->NEVER:Ljava/util/Date;

    .line 75
    new-instance v0, Lorg/eclipse/jgit/util/GitDateParser$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/GitDateParser$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateParser;->formatCache:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    return-void
.end method

.method private static getDateFormat(Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;Ljava/util/Locale;)Ljava/text/SimpleDateFormat;
    .locals 5
    .parameter "f"
    .parameter "locale"

    .prologue
    .line 88
    sget-object v4, Lorg/eclipse/jgit/util/GitDateParser;->formatCache:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 90
    .local v0, cache:Ljava/util/Map;,"Ljava/util/Map<Ljava/util/Locale;Ljava/util/Map<Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;Ljava/text/SimpleDateFormat;>;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 92
    .local v3, map:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;Ljava/text/SimpleDateFormat;>;"
    if-nez v3, :cond_1

    .line 93
    new-instance v3, Ljava/util/HashMap;

    .end local v3           #map:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;Ljava/text/SimpleDateFormat;>;"
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 94
    .restart local v3       #map:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;Ljava/text/SimpleDateFormat;>;"
    invoke-interface {v0, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    invoke-static {p0, p1, v3}, Lorg/eclipse/jgit/util/GitDateParser;->getNewSimpleDateFormat(Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;Ljava/util/Locale;Ljava/util/Map;)Ljava/text/SimpleDateFormat;

    move-result-object v1

    .line 101
    :cond_0
    :goto_0
    return-object v1

    .line 97
    :cond_1
    invoke-interface {v3, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/text/SimpleDateFormat;

    .line 98
    .local v1, dateFormat:Ljava/text/SimpleDateFormat;
    if-nez v1, :cond_0

    .line 100
    invoke-static {p0, p1, v3}, Lorg/eclipse/jgit/util/GitDateParser;->getNewSimpleDateFormat(Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;Ljava/util/Locale;Ljava/util/Map;)Ljava/text/SimpleDateFormat;

    move-result-object v2

    .local v2, df:Ljava/text/SimpleDateFormat;
    move-object v1, v2

    .line 101
    goto :goto_0
.end method

.method private static getNewSimpleDateFormat(Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;Ljava/util/Locale;Ljava/util/Map;)Ljava/text/SimpleDateFormat;
    .locals 3
    .parameter "f"
    .parameter "locale"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;",
            "Ljava/util/Locale;",
            "Ljava/util/Map",
            "<",
            "Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;",
            "Ljava/text/SimpleDateFormat;",
            ">;)",
            "Ljava/text/SimpleDateFormat;"
        }
    .end annotation

    .prologue
    .line 107
    .local p2, map:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;Ljava/text/SimpleDateFormat;>;"
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->formatStr:Ljava/lang/String;

    invoke-virtual {v1, v2, p1}, Lorg/eclipse/jgit/util/SystemReader;->getSimpleDateFormat(Ljava/lang/String;Ljava/util/Locale;)Ljava/text/SimpleDateFormat;

    move-result-object v0

    .line 109
    .local v0, df:Ljava/text/SimpleDateFormat;
    invoke-interface {p2, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    return-object v0
.end method

.method public static parse(Ljava/lang/String;Ljava/util/Calendar;)Ljava/util/Date;
    .locals 1
    .parameter "dateStr"
    .parameter "now"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 172
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/util/GitDateParser;->parse(Ljava/lang/String;Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Date;
    .locals 13
    .parameter "dateStr"
    .parameter "now"
    .parameter "locale"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 215
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 218
    const-string v8, "never"

    invoke-virtual {v8, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 219
    sget-object v6, Lorg/eclipse/jgit/util/GitDateParser;->NEVER:Ljava/util/Date;

    .line 225
    :cond_0
    :goto_0
    return-object v6

    .line 220
    :cond_1
    invoke-static {p0, p1}, Lorg/eclipse/jgit/util/GitDateParser;->parse_relative(Ljava/lang/String;Ljava/util/Calendar;)Ljava/util/Date;

    move-result-object v6

    .line 221
    .local v6, ret:Ljava/util/Date;
    if-nez v6, :cond_0

    .line 223
    invoke-static {}, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->values()[Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    move-result-object v1

    .local v1, arr$:[Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;
    array-length v5, v1

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_1
    if-ge v4, v5, :cond_2

    aget-object v2, v1, v4

    .line 225
    .local v2, f:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;
    :try_start_0
    invoke-static {p0, v2, p2}, Lorg/eclipse/jgit/util/GitDateParser;->parse_simple(Ljava/lang/String;Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;Ljava/util/Locale;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    goto :goto_0

    .line 226
    :catch_0
    move-exception v8

    .line 223
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 230
    .end local v2           #f:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;
    :cond_2
    invoke-static {}, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->values()[Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    move-result-object v7

    .line 231
    .local v7, values:[Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "\""

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v9, 0x0

    aget-object v9, v7, v9

    iget-object v9, v9, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->formatStr:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 233
    .local v0, allFormats:Ljava/lang/StringBuilder;
    const/4 v3, 0x1

    .local v3, i:I
    :goto_2
    array-length v8, v7

    if-ge v3, v8, :cond_3

    .line 234
    const-string v8, "\", \""

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, v7, v3

    iget-object v9, v9, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->formatStr:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 235
    :cond_3
    const-string v8, "\""

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    new-instance v8, Ljava/text/ParseException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v9

    iget-object v9, v9, Lorg/eclipse/jgit/internal/JGitText;->cannotParseDate:Ljava/lang/String;

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p0, v10, v11

    const/4 v11, 0x1

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-direct {v8, v9, v10}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v8
.end method

.method private static parse_relative(Ljava/lang/String;Ljava/util/Calendar;)Ljava/util/Date;
    .locals 14
    .parameter "dateStr"
    .parameter "now"

    .prologue
    const/16 v13, 0xb

    const/4 v12, 0x5

    const/4 v11, 0x3

    const/4 v7, 0x0

    const/4 v10, 0x0

    .line 252
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v6

    .line 255
    .local v6, sysRead:Lorg/eclipse/jgit/util/SystemReader;
    const-string v8, "now"

    invoke-virtual {v8, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 256
    if-nez p1, :cond_1

    new-instance v7, Ljava/util/Date;

    invoke-virtual {v6}, Lorg/eclipse/jgit/util/SystemReader;->getCurrentTime()J

    move-result-wide v8

    invoke-direct {v7, v8, v9}, Ljava/util/Date;-><init>(J)V

    .line 314
    :cond_0
    :goto_0
    return-object v7

    .line 256
    :cond_1
    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v7

    goto :goto_0

    .line 260
    :cond_2
    if-nez p1, :cond_3

    .line 261
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-virtual {v6}, Lorg/eclipse/jgit/util/SystemReader;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v8

    invoke-virtual {v6}, Lorg/eclipse/jgit/util/SystemReader;->getLocale()Ljava/util/Locale;

    move-result-object v9

    invoke-direct {v0, v8, v9}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;Ljava/util/Locale;)V

    .line 263
    .local v0, cal:Ljava/util/Calendar;
    invoke-virtual {v6}, Lorg/eclipse/jgit/util/SystemReader;->getCurrentTime()J

    move-result-wide v8

    invoke-virtual {v0, v8, v9}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 267
    :goto_1
    const-string v8, "yesterday"

    invoke-virtual {v8, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 268
    const/4 v7, -0x1

    invoke-virtual {v0, v12, v7}, Ljava/util/Calendar;->add(II)V

    .line 269
    invoke-virtual {v0, v13, v10}, Ljava/util/Calendar;->set(II)V

    .line 270
    const/16 v7, 0xc

    invoke-virtual {v0, v7, v10}, Ljava/util/Calendar;->set(II)V

    .line 271
    const/16 v7, 0xd

    invoke-virtual {v0, v7, v10}, Ljava/util/Calendar;->set(II)V

    .line 272
    const/16 v7, 0xe

    invoke-virtual {v0, v7, v10}, Ljava/util/Calendar;->set(II)V

    .line 273
    const/16 v7, 0xe

    invoke-virtual {v0, v7, v10}, Ljava/util/Calendar;->set(II)V

    .line 274
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v7

    goto :goto_0

    .line 265
    .end local v0           #cal:Ljava/util/Calendar;
    :cond_3
    invoke-virtual {p1}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    .restart local v0       #cal:Ljava/util/Calendar;
    goto :goto_1

    .line 278
    :cond_4
    const-string v8, "\\.| "

    invoke-virtual {p0, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 279
    .local v4, parts:[Ljava/lang/String;
    array-length v5, v4

    .line 282
    .local v5, partsLength:I
    if-lt v5, v11, :cond_0

    and-int/lit8 v8, v5, 0x1

    if-eqz v8, :cond_0

    const-string v8, "ago"

    array-length v9, v4

    add-int/lit8 v9, v9, -0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 286
    const/4 v2, 0x0

    .local v2, i:I
    :goto_2
    array-length v8, v4

    add-int/lit8 v8, v8, -0x2

    if-ge v2, v8, :cond_12

    .line 288
    :try_start_0
    aget-object v8, v4, v2

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 292
    .local v3, number:I
    const-string v8, "year"

    add-int/lit8 v9, v2, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5

    const-string v8, "years"

    add-int/lit8 v9, v2, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 293
    :cond_5
    const/4 v8, 0x1

    neg-int v9, v3

    invoke-virtual {v0, v8, v9}, Ljava/util/Calendar;->add(II)V

    .line 286
    :goto_3
    add-int/lit8 v2, v2, 0x2

    goto :goto_2

    .line 289
    .end local v3           #number:I
    :catch_0
    move-exception v1

    .line 290
    .local v1, e:Ljava/lang/NumberFormatException;
    goto/16 :goto_0

    .line 294
    .end local v1           #e:Ljava/lang/NumberFormatException;
    .restart local v3       #number:I
    :cond_6
    const-string v8, "month"

    add-int/lit8 v9, v2, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7

    const-string v8, "months"

    add-int/lit8 v9, v2, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 296
    :cond_7
    const/4 v8, 0x2

    neg-int v9, v3

    invoke-virtual {v0, v8, v9}, Ljava/util/Calendar;->add(II)V

    goto :goto_3

    .line 297
    :cond_8
    const-string v8, "week"

    add-int/lit8 v9, v2, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_9

    const-string v8, "weeks"

    add-int/lit8 v9, v2, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 299
    :cond_9
    neg-int v8, v3

    invoke-virtual {v0, v11, v8}, Ljava/util/Calendar;->add(II)V

    goto :goto_3

    .line 300
    :cond_a
    const-string v8, "day"

    add-int/lit8 v9, v2, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_b

    const-string v8, "days"

    add-int/lit8 v9, v2, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_c

    .line 301
    :cond_b
    neg-int v8, v3

    invoke-virtual {v0, v12, v8}, Ljava/util/Calendar;->add(II)V

    goto :goto_3

    .line 302
    :cond_c
    const-string v8, "hour"

    add-int/lit8 v9, v2, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_d

    const-string v8, "hours"

    add-int/lit8 v9, v2, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_e

    .line 304
    :cond_d
    neg-int v8, v3

    invoke-virtual {v0, v13, v8}, Ljava/util/Calendar;->add(II)V

    goto :goto_3

    .line 305
    :cond_e
    const-string v8, "minute"

    add-int/lit8 v9, v2, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_f

    const-string v8, "minutes"

    add-int/lit8 v9, v2, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_10

    .line 307
    :cond_f
    const/16 v8, 0xc

    neg-int v9, v3

    invoke-virtual {v0, v8, v9}, Ljava/util/Calendar;->add(II)V

    goto/16 :goto_3

    .line 308
    :cond_10
    const-string v8, "second"

    add-int/lit8 v9, v2, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_11

    const-string v8, "seconds"

    add-int/lit8 v9, v2, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 310
    :cond_11
    const/16 v8, 0xd

    neg-int v9, v3

    invoke-virtual {v0, v8, v9}, Ljava/util/Calendar;->add(II)V

    goto/16 :goto_3

    .line 314
    .end local v3           #number:I
    :cond_12
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v7

    goto/16 :goto_0
.end method

.method private static parse_simple(Ljava/lang/String;Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;Ljava/util/Locale;)Ljava/util/Date;
    .locals 2
    .parameter "dateStr"
    .parameter "f"
    .parameter "locale"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 244
    invoke-static {p1, p2}, Lorg/eclipse/jgit/util/GitDateParser;->getDateFormat(Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;Ljava/util/Locale;)Ljava/text/SimpleDateFormat;

    move-result-object v0

    .line 245
    .local v0, dateFormat:Ljava/text/SimpleDateFormat;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    .line 246
    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method
