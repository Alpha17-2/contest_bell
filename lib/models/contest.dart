class Contest {
    dynamic id;
    String? name;
    Type? type;
    Phase? phase;
    bool? frozen;
    int? durationSeconds;
    int? startTimeSeconds;
    int? relativeTimeSeconds;
    int? freezeDurationSeconds;
    String? platform;

    Contest({
        this.id,
        this.name,
        this.type,
        this.phase,
        this.frozen,
        this.durationSeconds,
        this.startTimeSeconds,
        this.relativeTimeSeconds,
        this.freezeDurationSeconds,
        this.platform = 'Codeforces',
    });

    Contest copyWith({
        int? id,
        String? name,
        Type? type,
        Phase? phase,
        bool? frozen,
        int? durationSeconds,
        int? startTimeSeconds,
        int? relativeTimeSeconds,
        int? freezeDurationSeconds,
        String? platform,
    }) => 
        Contest(
            id: id ?? this.id,
            name: name ?? this.name,
            type: type ?? this.type,
            phase: phase ?? this.phase,
            frozen: frozen ?? this.frozen,
            durationSeconds: durationSeconds ?? this.durationSeconds,
            startTimeSeconds: startTimeSeconds ?? this.startTimeSeconds,
            relativeTimeSeconds: relativeTimeSeconds ?? this.relativeTimeSeconds,
            platform: platform ?? this.platform,
            freezeDurationSeconds: freezeDurationSeconds ?? this.freezeDurationSeconds,
        );

    factory Contest.fromJson(Map<String, dynamic> json) => Contest(
        id: json["id"],
        name: json["name"],
        type: typeValues.map[json["type"]],
        phase: phaseValues.map[json["phase"]],
        frozen: json["frozen"],
        durationSeconds: json["durationSeconds"],
        startTimeSeconds: json["startTimeSeconds"],
        relativeTimeSeconds: json["relativeTimeSeconds"],
        freezeDurationSeconds: json["freezeDurationSeconds"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": typeValues.reverse[type],
        "phase": phaseValues.reverse[phase],
        "frozen": frozen,
        "durationSeconds": durationSeconds,
        "startTimeSeconds": startTimeSeconds,
        "relativeTimeSeconds": relativeTimeSeconds,
        "freezeDurationSeconds": freezeDurationSeconds,
    };
}

enum Phase {
    BEFORE,
    FINISHED
}

final phaseValues = EnumValues({
    "BEFORE": Phase.BEFORE,
    "FINISHED": Phase.FINISHED
});

enum Type {
    CF,
    ICPC,
    IOI
}

final typeValues = EnumValues({
    "CF": Type.CF,
    "ICPC": Type.ICPC,
    "IOI": Type.IOI
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
