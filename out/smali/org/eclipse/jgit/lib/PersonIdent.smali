.class public Lorg/eclipse/jgit/lib/PersonIdent;
.super Ljava/lang/Object;
.source "PersonIdent.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final emailAddress:Ljava/lang/String;

.field private final name:Ljava/lang/String;

.field private final tzOffset:I

.field private final when:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "aName"
    .parameter "aEmailAddress"

    .prologue
    .line 101
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/SystemReader;->getCurrentTime()J

    move-result-wide v0

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 102
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 6
    .parameter "aName"
    .parameter "aEmailAddress"
    .parameter "when"

    .prologue
    .line 162
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Lorg/eclipse/jgit/util/SystemReader;->getTimezone(J)I

    move-result v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;JI)V

    .line 164
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JI)V
    .locals 2
    .parameter "aName"
    .parameter "aEmailAddress"
    .parameter "aWhen"
    .parameter "aTZ"

    .prologue
    .line 181
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 182
    if-nez p1, :cond_0

    .line 183
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Name of PersonIdent must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 185
    :cond_0
    if-nez p2, :cond_1

    .line 186
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "E-mail address of PersonIdent must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 188
    :cond_1
    iput-object p1, p0, Lorg/eclipse/jgit/lib/PersonIdent;->name:Ljava/lang/String;

    .line 189
    iput-object p2, p0, Lorg/eclipse/jgit/lib/PersonIdent;->emailAddress:Ljava/lang/String;

    .line 190
    iput-wide p3, p0, Lorg/eclipse/jgit/lib/PersonIdent;->when:J

    .line 191
    iput p5, p0, Lorg/eclipse/jgit/lib/PersonIdent;->tzOffset:I

    .line 192
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/TimeZone;)V
    .locals 6
    .parameter "aName"
    .parameter "aEmailAddress"
    .parameter "aWhen"
    .parameter "aTZ"

    .prologue
    .line 142
    invoke-virtual {p3}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    invoke-virtual {p3}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p4, v0, v1}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v0

    const v1, 0xea60

    div-int v5, v0, v1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;JI)V

    .line 144
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/PersonIdent;)V
    .locals 2
    .parameter "pi"

    .prologue
    .line 91
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getEmailAddress()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/PersonIdent;JI)V
    .locals 6
    .parameter "pi"
    .parameter "aWhen"
    .parameter "aTZ"

    .prologue
    .line 157
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getEmailAddress()Ljava/lang/String;

    move-result-object v2

    move-object v0, p0

    move-wide v3, p2

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;JI)V

    .line 158
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/PersonIdent;Ljava/util/Date;)V
    .locals 6
    .parameter "pi"
    .parameter "aWhen"

    .prologue
    .line 127
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getEmailAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    iget v5, p1, Lorg/eclipse/jgit/lib/PersonIdent;->tzOffset:I

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;JI)V

    .line 128
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/PersonIdent;Ljava/util/Date;Ljava/util/TimeZone;)V
    .locals 2
    .parameter "pi"
    .parameter "when"
    .parameter "tz"

    .prologue
    .line 115
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getEmailAddress()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1, p2, p3}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/TimeZone;)V

    .line 116
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "repo"

    .prologue
    .line 81
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/lib/UserConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/UserConfig;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Lorg/eclipse/jgit/lib/UserConfig;)V

    .line 82
    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/lib/UserConfig;)V
    .locals 2
    .parameter "config"

    .prologue
    .line 167
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/UserConfig;->getCommitterName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/UserConfig;->getCommitterEmail()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    return-void
.end method

.method private appendTimezone(Ljava/lang/StringBuilder;)V
    .locals 6
    .parameter "r"

    .prologue
    const/16 v5, 0x30

    const/16 v4, 0xa

    .line 268
    iget v0, p0, Lorg/eclipse/jgit/lib/PersonIdent;->tzOffset:I

    .line 273
    .local v0, offset:I
    if-gez v0, :cond_2

    .line 274
    const/16 v3, 0x2d

    .line 275
    .local v3, sign:C
    neg-int v0, v0

    .line 280
    :goto_0
    div-int/lit8 v1, v0, 0x3c

    .line 281
    .local v1, offsetHours:I
    rem-int/lit8 v2, v0, 0x3c

    .line 283
    .local v2, offsetMins:I
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 284
    if-ge v1, v4, :cond_0

    .line 285
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 287
    :cond_0
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 288
    if-ge v2, v4, :cond_1

    .line 289
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 291
    :cond_1
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 292
    return-void

    .line 277
    .end local v1           #offsetHours:I
    .end local v2           #offsetMins:I
    .end local v3           #sign:C
    :cond_2
    const/16 v3, 0x2b

    .restart local v3       #sign:C
    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .parameter "o"

    .prologue
    const-wide/16 v6, 0x3e8

    const/4 v1, 0x0

    .line 241
    instance-of v2, p1, Lorg/eclipse/jgit/lib/PersonIdent;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 242
    check-cast v0, Lorg/eclipse/jgit/lib/PersonIdent;

    .line 243
    .local v0, p:Lorg/eclipse/jgit/lib/PersonIdent;
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/PersonIdent;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/PersonIdent;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/PersonIdent;->getEmailAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/PersonIdent;->getEmailAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lorg/eclipse/jgit/lib/PersonIdent;->when:J

    div-long/2addr v2, v6

    iget-wide v4, v0, Lorg/eclipse/jgit/lib/PersonIdent;->when:J

    div-long/2addr v4, v6

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    const/4 v1, 0x1

    .line 247
    .end local v0           #p:Lorg/eclipse/jgit/lib/PersonIdent;
    :cond_0
    return v1
.end method

.method public getEmailAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lorg/eclipse/jgit/lib/PersonIdent;->emailAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 198
    iget-object v0, p0, Lorg/eclipse/jgit/lib/PersonIdent;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeZone()Ljava/util/TimeZone;
    .locals 2

    .prologue
    .line 219
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 220
    .local v0, tzId:Ljava/lang/StringBuilder;
    const-string v1, "GMT"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/lib/PersonIdent;->appendTimezone(Ljava/lang/StringBuilder;)V

    .line 222
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    return-object v1
.end method

.method public getTimeZoneOffset()I
    .locals 1

    .prologue
    .line 230
    iget v0, p0, Lorg/eclipse/jgit/lib/PersonIdent;->tzOffset:I

    return v0
.end method

.method public getWhen()Ljava/util/Date;
    .locals 3

    .prologue
    .line 212
    new-instance v0, Ljava/util/Date;

    iget-wide v1, p0, Lorg/eclipse/jgit/lib/PersonIdent;->when:J

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .prologue
    .line 234
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/PersonIdent;->getEmailAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 235
    .local v0, hc:I
    mul-int/lit8 v0, v0, 0x1f

    .line 236
    iget-wide v1, p0, Lorg/eclipse/jgit/lib/PersonIdent;->when:J

    const-wide/16 v3, 0x3e8

    div-long/2addr v1, v3

    long-to-int v1, v1

    add-int/2addr v0, v1

    .line 237
    return v0
.end method

.method public toExternalString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 256
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 257
    .local v0, r:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/PersonIdent;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    const-string v1, " <"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/PersonIdent;->getEmailAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    const-string v1, "> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    iget-wide v1, p0, Lorg/eclipse/jgit/lib/PersonIdent;->when:J

    const-wide/16 v3, 0x3e8

    div-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 262
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 263
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/lib/PersonIdent;->appendTimezone(Ljava/lang/StringBuilder;)V

    .line 264
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 296
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 298
    .local v1, r:Ljava/lang/StringBuilder;
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v2, "EEE MMM d HH:mm:ss yyyy Z"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 299
    .local v0, dtfmt:Ljava/text/SimpleDateFormat;
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/PersonIdent;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 301
    const-string v2, "PersonIdent["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/PersonIdent;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/PersonIdent;->getEmailAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    iget-wide v2, p0, Lorg/eclipse/jgit/lib/PersonIdent;->when:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
